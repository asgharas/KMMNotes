//
//  HideAbleSearchTextField.swift
//  iosApp
//
//  Created by Asghar on 7/23/23.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

struct HideAbleSearchTextField<Destination: View>: View {
    var onSearchChanged: (String) -> Void
    var destinationProvider: () -> Destination
    var isSearchActive: Bool
    @Binding var searchText: String
    
    var body: some View {
        HStack
    }
}

struct HideAbleSearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        HideAbleSearchTextField()
    }
}
