//
//  StudentOrgs.swift
//  DrakeOrgs.xcodeproject
//
//  Created by Nguyen Nguyen on 3/18/24.
//

import Foundation

// This will be replaced by an API call later on.

let studentOrgs=[
    "Best Buddies" , "Drake R.E.A.D.S" , "Drake University Veterans Association (DUVA)" , "DU Bulldog Catholic " , "Campus Fellowship (CF)" , "Phi Alpha Theta" , "Drake Political Review" , "Drake Non-Profit Consulting Group" , "Interfaith @ Drake" , "Gamma Iota Sigma" , "Ultimate Frisbee Club" , "Phi Lambda Sigma" , "Middle East Peace & Prosperity Alliance (MEPPA)" , "Drake Broadcasting System" , "Sigma Gamma Rho" , "Anime Club" , "Psi Chi" , "The Salt Company Des Moines" , "Drake Men's Soccer Club" , "Phi Delta Theta" , "Honors Program Student Council" , "Drake Outdoor Leadership Club" , "Kappa Mu Epsilon" , "Drake University Swim Club" , "Zimpleman College of Business Ambassadors" , "Unity Roundtable" , "Dogtown After Hours" , "Delta Sigma Theta" , "Sigma Tau Delta" , "International Students Association (ISA)" , "American Pharmacist Association-Academy of Student Pharmacist" , "Visual Arts Association at Drake" , "Christian Pharmacists Fellowship International (CPFI)" , "Drake Weightlifting and Fitness Club" , "Alpha Phi" , "Kappa Kappa Gamma" , "College Republicans" , "American Association of Pharmaceutical Scientists (AAPS)" , "American Marketing Association" , "Kappa Psi" , "CPHS Ambassadors" , "Beta Alpha Psi" , "Alpha Kappa Alpha" , "Phi Delta Chi" , "Drake University Dance Marathon" , "Alpha Delta Pi" , "Phi Mu Alpha Sinfonia" , "Drake University Dance Team" , "Drake Theater People" , "DUiN" , "Drake Environmental Action League (DEAL)" , "Women's Club Volleyball" , "Student Senate" , "Fellowship of Christian Athletes" , "Coalition of Occupational Therapy Advocates for Diversity" , "Resident Hall Association (RHA)" , "org_name" , "Student College of Clinical Pharmacy" , "Men's Club Volleyball" , "Delta Gamma" , "Women in Business" , "Beta Beat Beta" , "Chemistry Club" , "Drake Badminton Club" , "Drake Association of Technology Advancement" , "Blue Crew Dance Club" , "Epsilon Eta" , "PRSSA" , "Running Club" , "Drake Actuarial Student Society (DASS)" , "American Society of Health-System Pharmacists" , "test" , "Periphery Art & Literary Journal" , "Women in STEM" , "Drake Magazine" , "National Pan-Hellenic Council" , "Drake University Club Hockey" , "La Fuerza Latina (LFL)" , "Alpha Phi Omega" , "Drake Mock Trial" , "Drake Democrats" , "Kappa Alpha Theta" , "Kappa Delta Pi" , "Bulldogs Training Animals in Life Service (TAILS)" , "Chi Alpha Christian  Fellowship" , "Sigma Alpha Epsilon" , "Drake Chess Club" , "Delta Sigma Pi" , "Times Delphic" , "Drake Pharmacy United Group of Students (DRxUGS)" , "Habitat for Humanity" , "Drake Video Game Club" , "Pre-Med Club" , "Sigma Alpha Iota" , "Board Game Club" , "Phi Delta Epsilon" , "Asian Student Union" , "National Community Oncology Dispensing Association" , "African Caribbean Student Association (ASCA)" , "Panhellenic Sororities" , "Theta Chi" , "Intervarsity Christian Fellowsip" , "Roosevelt Institute" , "The Coalition of Black Student (CBS)" , "Drake First Gen Bulldogs" , "Pi Theta Epsilon" , "Drake Student Occupational Therapy Association (DUSOTA)" , "Hillel" , "Rainbow Union" , "D+ Improv Troupe" , "HOSA" , "Tau Kappa Epsilon" , "American Society of Consultant Pharmacists" , "Sigma Chi" , "Sigma Phi Epsilon" , "Interfraternity Council (IFC)" , "Investment Club" , "Alpha Kappa Psi" , "Ro Chi" , "Student National Pharmaceutical Association(SNAPhA)" , "Human Resources Association" , "Next Course - Food Recovery Network at Drake" , "Phi Chi Theta" , "National Association for Music Education" , "Drake Tennis Club" , "Lambda Kappa Sigma" , "Big Brothers Big Sisters at Drake" , "Phi Gamma Delta" , "Women's Club Soccer Team" , "Muslim Student Association (MSA)" , "Finance Society"
    
]
let CollegeOfArtsSciences=["Chemistry Club", "Epsilon Eta", "Periphery Art & Literary Journal", "Pre-Med Club", "Visual Arts Association at Drake", "Women in Stem"]

let ZimplemanCollegeOfBusniess=["American Marketing Association", "Drake Actuarial Student Society (DASS)", "Drake Association of Technology Advancement (DATA)", "Finance Society", "Investment Club", "Investment Club", "Women In Business", "Zimpleman College of Business Ambassadors", "Alpha Kappa Psi", "Delta Sigma Pi", "Gamma Iota Sigma", "Phi Chi Theta"]

let CollegeOfPharmacyHealthSciences=["American Association of Pharmaceutical Scientists (AAPS)", "American Pharmacist Association-Academy of Student Pharmacist", "American Society of Consultant Pharmacists", "American Society of Health-System Pharmacists", "Coalition of Occupational Therapy Advocates for Diversity", "CPHS Ambassadors", "Drake Pharmacy United Group of Students (DRxUGS)", "Drake Student Occupational Therapy Association (DUSOTA)", "HOSA", "Student College of Clinical Pharmacy", "Student National Pharmaceutical Association (SNAPhA)", "Kappa Psi", "Lamda Kappa Sigma", "Phi Delta Chi", "Phi Delta Epsilon", "Pi Theta Epsilon"]

let Honorary=["Beta Beta Beta (Biology)", "Kappa Delta Pi (Education)", "Kappa Mu Epsilon (Math)", "Order of Omega (Fraternity & Sorority Life)", "Phi Alpha Theta (History)", "Phi Lambda Sigma Society (Pharmacy)", "Psi Chi (Psychology)", "Rho Chi Pharmacy Academic Honor Society", "Sigma Tau Delta (English)"]

let SchoolofJournalismMassCommunication=["Drake Broadcasting System (DBS)", "Drake Magazine", "Drake Political Review (DPR)", "Drake University Independent Magazine (DUiN)", "Public Relations Student Society of America (PRSSA)", "Times Delphic"]

let FraternitySororityLife=["Alpha Delta Pi", "Alpha Kappa Alpha Sorority, Inc.", "Alpha Phi", "Delta Gamma", "Delta Sigma Theta, Sorority Inc.", "Kappa Alpha Theta", "Kappa Aplha Psi Fraternity, Inc.", "Kappa Kappa Gamma", "Phi Delta Theta", "Phi Gamma Delta (FIJI)", "Sigma Alpha Epsilon", "Sigma Chi Fraternity", "Sigma Phi Epsilon", "Sigma Gamma Rho Sorority, Inc.", "Tau Kappa Epsilon", "Theta Chi"]

let Governing=["Interfraternity Council (IFC)", "National Pan-Hellenic Council", "Panhellenic Council", "Resident Hall Association (RHA)", "Student Senate", "Unity Roundtable"]

let Multicultural=["African & Caribbean Students Association", "Coalition of Black Students (CBS)", "International Student Association (ISA)", "La Fuerza Latina (LFL)", "Middle East Peace and Prosperity Alliance (MEPPA)", "Rainbow Union"]

let Political=["College Republicans", "Drake Democrats", "Roosevelt Institute at Drake University"]

let ReligiousSpiritual=["Campus Fellowship (CF)", "Chi Alpha Christian Fellowship", "Christian Pharmacists Fellowship international (CPFI)", "DU Bulldog Catholic", "Fellowship of Christian Athletes", "Hillel", "Interfaith at Drake", "Intervarsity Christian Fellowship", "The Salt Company Des Moines"]

let Recreational=["Blue Crew Dance Team", "Drake Dance Team", "Drake Outdoor Leadership Club", "Drake Weightlifting and Fitness Club", "Running Club"]

let SportsClubs=["Badminton Club", "Hockey Club", "Mens Club Volleyball", "Men's Soccer Club", "Swimming Club", "Tennis Club", "Ultimate Frisbee Club", "Women's Club Volleyball", "Women's Club Soccer"]

let Service=["Alpha Phi Omega (APO)", "Best Buddies", "Bigs @ Drake", "Bulldogs Training Animals in Life Service (TAILS)", "Dance Marathon", "Habitat for Humanity", "Next Course - Food Recovery Network at Drake", "Optimist Club"]

let SpecialInterest=["Anime Club", "Board Game Club", "Chess Club", "D+ Improv Troupe", "Dogtown After Hours (DTAH)", "Drake Environmental Action League (DEAL)", "Drake First Gen Bulldogs", "Drake Video Game Club", "Drake READS", "Drake Theatre People", "Drake University Veterans Association (DUVA)", "Fermata the Blue", "Finance Society", "Honors Program Student Council", "Japanese Culture and Language Association", "Mock Trial", "Poker Club", "Drake Quiz Bowl", "Save the Children Action Network (SCAN)", "Student Activities Board (SAB)", "Students for Reproductive Justice"]
