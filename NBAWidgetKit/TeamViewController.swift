//
//  ViewController.swift
//  NBAWidgetKit
//
//  Created by Nicholas Wang on 2021-01-11.
//

import UIKit

class TeamViewController: UIViewController {
    
    @IBOutlet weak var teamTableView: UITableView!
    
    var priority: Int!
    weak var delegate: MainDelegate?
    
    var teams = [["Atlanta Hawks", "http://assets.stickpng.com/thumbs/58419be4a6515b1e0ad75a58.png"],
                 ["Brooklyn Nets", "http://assets.stickpng.com/thumbs/58419c7ba6515b1e0ad75a62.png"],
                 ["Boston Celtics", "http://assets.stickpng.com/thumbs/58419c6aa6515b1e0ad75a61.png"],
                 ["Charlotte Hornets", "http://assets.stickpng.com/thumbs/58419bd7a6515b1e0ad75a57.png"],
                 ["Chicago Bulls", "http://assets.stickpng.com/thumbs/58419cf6a6515b1e0ad75a6b.png"],
                 ["Cleveland Cavaliers", "http://assets.stickpng.com/thumbs/58419c8da6515b1e0ad75a63.png"],
                 ["Dallas Mavericks", "http://assets.stickpng.com/thumbs/58419cd6a6515b1e0ad75a68.png"],
                 ["Denver Nuggets", "http://assets.stickpng.com/thumbs/58419b70a6515b1e0ad75a50.png"],
                 ["Detroit Pistons", "http://assets.stickpng.com/thumbs/58419c4ca6515b1e0ad75a5f.png"],
                 ["Golden State Warriors", "http://assets.stickpng.com/thumbs/58419ce2a6515b1e0ad75a69.png"],
                 ["Houston Rockets", "http://assets.stickpng.com/thumbs/58419ceda6515b1e0ad75a6a.png"],
                 ["Indiana Pacers", "http://assets.stickpng.com/thumbs/58419b8da6515b1e0ad75a52.png"],
                 ["Los Angeles Clippers", "http://assets.stickpng.com/thumbs/58419c59a6515b1e0ad75a60.png"],
                 ["Los Angeles Lakers", "http://assets.stickpng.com/thumbs/58419d0aa6515b1e0ad75a6c.png"],
                 ["Memphis Grizzlies", "http://assets.stickpng.com/thumbs/58419c00a6515b1e0ad75a5a.png"],
                 ["Miami Heat", "http://assets.stickpng.com/thumbs/58419cafa6515b1e0ad75a65.png"],
                 ["Milwaukee Bucks", "http://assets.stickpng.com/thumbs/58419ba7a6515b1e0ad75a54.png"],
                 ["Minnesota Timberwolves", "http://assets.stickpng.com/thumbs/58419bc5a6515b1e0ad75a56.png"],
                 ["New Orleans Pelicans", "http://assets.stickpng.com/thumbs/58419b9ba6515b1e0ad75a53.png"],
                 ["New York Knicks", "http://assets.stickpng.com/thumbs/58419cc8a6515b1e0ad75a67.png"],
                 ["Oklahoma City Thunder", "http://assets.stickpng.com/thumbs/58419c20a6515b1e0ad75a5c.png"],
                 ["Orlando Magic", "http://assets.stickpng.com/thumbs/58419b7da6515b1e0ad75a51.png"],
                 ["Philadelphia 76ers", "http://assets.stickpng.com/thumbs/58419ca3a6515b1e0ad75a64.png"],
                 ["Phoenix Suns", "http://assets.stickpng.com/thumbs/58419d52a6515b1e0ad75a6d.png"],
                 ["Portland Trailblazers", "http://assets.stickpng.com/thumbs/58419c2fa6515b1e0ad75a5d.png"],
                 ["Sacramento Kings", "http://assets.stickpng.com/thumbs/58419c3da6515b1e0ad75a5e.png"],
                 ["San Antonio Spurs", "http://assets.stickpng.com/thumbs/58419cbca6515b1e0ad75a66.png"],
                 ["Toronto Raptors", "http://assets.stickpng.com/thumbs/58419bf3a6515b1e0ad75a59.png"],
                 ["Utah Jazz", "http://assets.stickpng.com/thumbs/58419bb6a6515b1e0ad75a55.png"],
                 ["Washington Wizards", "http://assets.stickpng.com/thumbs/58419c12a6515b1e0ad75a5b.png"]
                ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension TeamViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell") as! TeamCell
        let url = URL(string: teams[indexPath.row][1])
        let data = try? Data(contentsOf: url!)
        cell.teamNameLbl.text = teams[indexPath.row][0]
        cell.teamImage.image = UIImage(data: data!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 73
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if priority == 1 {
            delegate?.firstPreference = teams[indexPath.row]
        } else if priority == 2 {
            delegate?.secondPreference = teams[indexPath.row]
        } else if priority == 3 {
            delegate?.thirdPreference = teams[indexPath.row]
        }
        self.dismiss(animated: true, completion: delegate?.reloadView)
    }
    
}
