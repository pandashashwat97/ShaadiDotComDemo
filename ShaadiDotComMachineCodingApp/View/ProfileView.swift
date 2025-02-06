//
//  ProfileView.swift
//  ShaadiDotComMachineCodingApp
//
//  Created by Shashwat Panda on 04/02/25.
//

import SwiftUI
import SwiftData

struct ProfileView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query var profiles: [Profiles]
    
    // Profiles that are yet to be seen
    private var unselectedProfiles: [Profiles] {
        profiles.filter{ $0.selectionStatus == nil }
    }
    
    // Profiles that are accepted
    private var acceptedProfiles: [Profiles] {
        profiles.filter{ $0.selectionStatus == Constants.SelectionStatus.accepted }
    }
    
    // Profiles that are rejected
    private var declinedProfiles: [Profiles] {
        profiles.filter{ $0.selectionStatus == Constants.SelectionStatus.declined }
    }
    
    var vm = ViewModel()
    
    var body: some View {
        TabView{
            // Accepted Profiles Tab
            NavigationStack{
                ScrollView {
                    ForEach(acceptedProfiles, id: \.value) { result in
                        CardView(result: result)
                            .padding(.bottom, 10)
                    }
                }
                .navigationTitle(Constants.Titles.acceptedProfiles)
            }
            .tabItem {
                Image(systemName: Constants.TabImages.acceptedProfiles)
            }
            // Unselected Profiles Tab
            NavigationStack{
                ScrollView {
                    ForEach(unselectedProfiles, id: \.value) { result in
                        CardView(result: result)
                            .padding(.bottom, 10)
                    }
                }
                .navigationTitle(Constants.Titles.unseenProfiles)
            }
            .tabItem {
                Image(systemName: Constants.TabImages.unseenProfiles)
            }
            // Declined Profiles Tab
            NavigationStack{
                ScrollView {
                    ForEach(declinedProfiles, id: \.value) { result in
                        CardView(result: result)
                            .padding(.bottom, 10)
                    }
                }
                .navigationTitle(Constants.Titles.declinedProfile)
            }
            .tabItem {
                Image(systemName: Constants.TabImages.declinedProfile)
            }
        }
        .accentColor(Color.black)
        .task{
            await fetchData()
        }
    }
    
    // to trigger network call
    func fetchData() async {
        vm.apiCall(modelContext: modelContext)
    }
}

#Preview {
    ProfileView()
}
