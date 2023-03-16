//
//  LogoView.swift
//  FinalProject
//
//  Created by Hertzog, Kenton Brandt on 4/6/22.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Image("AppLogo")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
