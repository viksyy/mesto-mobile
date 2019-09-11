//
//  RestaurantsTableViewController.m
//  Mesto
//
//  Created by x on 4/1/19.
//  Copyright © 2019 x. All rights reserved.
//

#import "RestaurantsTableViewController.h"
#import "../../../Mesto/Controllers/RestaurantsController.h"
#import "Views/RestaurantTableViewCell.h"
#import "./Models/Restaurant.h"
#import ".././General/NavigationController.h"

@interface RestaurantsTableViewController ()
@property (strong, nonatomic) NSMutableArray<Restaurant *> *restaurants;
@property (copy, nonatomic) NSArray *imageArray;
@end

@implementation RestaurantsTableViewController

NSString *cellId = @"RestaurantCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.restaurants = NSMutableArray.new;
    completion completionBlock = ^{
        NSLog(@"Complete !");
        if ([self.refreshControl isRefreshing]) {
            [self.refreshControl endRefreshing];
        }
    };
    
    
    success successBlock = ^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success !");
        //TODO json parse data
        self.imageArray = @[@"https://equilibrium.mk/wp-content/uploads/2018/04/IMG_5476-HDR-copy-1024x683.jpg",@"https://equilibrium.mk/wp-content/uploads/2018/04/IMG_5476-HDR-copy-1024x683.jpg", @"https://ak5.picdn.net/shutterstock/videos/11570375/thumb/1.jpg"];
        NSArray *serverData = responseObject;
        for (NSDictionary *item in serverData){
            NSString *name = item[@"title"][@"rendered"];
            NSString *distance = item[@"id"];
            
            Restaurant *rest = Restaurant.new;
            rest.Id = distance;
            rest.name = name;
            rest.distance = distance;
            [self.restaurants addObject:rest];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    };
    
    failure failureBlock = ^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    
    };
    [RestaurantsController getRestaurants:completionBlock success:successBlock failure:failureBlock];
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows

    return self.restaurants.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RestaurantTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    Restaurant *r = [self.restaurants objectAtIndex:indexPath.row];
    NSURL *url = [NSURL URLWithString:[self.imageArray objectAtIndex:indexPath.row]];
    [r setUrlImage:url];
    [cell configure:r];
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
////    [self performSegueWithIdentifier:@"YourSegue" sender:self];
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
