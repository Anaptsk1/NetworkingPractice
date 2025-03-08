//
//  singleResourceView.swift
//  NetworkingPractice
//
//  Created by Ana Ptskialadze on 08.03.25.
//

import SwiftUI

struct SingleResourceView: View {
    
    var resources: Resources
    
    var body: some View {
        Text(resources.title)
        Text("\(resources.userId)")
        Text(resources.body)
    }
}
