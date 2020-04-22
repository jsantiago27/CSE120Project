//
//  Delaunays.swift
//  Project App
//
//  Created by Ricky Trujillo on 4/21/20.
//  Copyright © 2020 Jefferson Santiago. All rights reserved.
//

import Foundation

//A - focal length w/ GPS coordinates

//B - focal length w/ GPS coordinates

//C -focal length w/ GPS coordinates

// point of interest


/*
 Blue and Red Triangle information
 1. Object distance from point B (l_2)
 2. Point distance of A-->B  (point slope formula) --> midpoint AB/2
 3. alpha_3 = cos^-1( (AB/2) / l_2)
 4. beta_2_half= 180-90-alpha_3
    beta_2 = 2* beta_2_half
 5. Object distance from point C (l_3)
 6. Point distance of A-->C  (point slope formula) --> midpoint AC/2
 7. alpha_4 = cos^-1( (AC/2) / l_3)
 8. beta_1_half=180-90-alpha_4
 9. beta_1 = 2*beta_1_half
 
 Green Triangle Information
 10. Calculate l_1 (object distance from point A)
 10. Find the distance between AB/2 and AC/2  = DE
 10. Mid point of DE = DE/2 = mid_DE
 11. alpha_2= cos^-1((AB)/2)/l_1)
 12. alpha_5= 180-90-alpha_3
 13. alpha_6 = 90 - alpha_5
 14. hypotnuse* cos(alpha_2) = D_2
 15. l_2*cos(alpha_3) = l_5
 16. D_1= l_5*sin(alpha_6)
 
 True Object Distance = A * coordinate_length(D_1) + coordinate_length(D_2)
 */



