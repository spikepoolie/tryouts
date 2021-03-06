//
//  CoachesNames.swift
//  Tryouts
//
//  Created by Rodrigo Schreiner on 1/7/19.
//  Copyright © 2019 GoEmobile. All rights reserved.
//

class CoachesNames {
    var coach_name: String?
    var coach_phone: String?
    var coach_email: String?
    var team_code: String?
    var coach_invited: String?
    
    init(coach_name:String?, coach_phone:String?,coach_email:String?,team_code:String?,coach_invited:String?){
        self.coach_name = coach_name;
        self.coach_phone = coach_phone;
        self.coach_email = coach_email;
        self.team_code = team_code;
        self.coach_invited = coach_invited;
    }
}
