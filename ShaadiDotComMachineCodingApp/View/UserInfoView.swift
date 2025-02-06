//
//  UserInfoView.swift
//  ShaadiDotComMachineCodingApp
//
//  Created by Shashwat Panda on 05/02/25.
//

import SwiftUI
import SwiftData

struct UserInfoView: View {
    
    @Environment(\.modelContext) private var modelContext
    @State var showLongDesc: Bool = false
    var vm = ViewModel()
    var result: Profiles
    
    private var name: String {
        result.name.first + " " + result.name.last + ", " + String(result.registered.age)
    }
    private var shortDesc: String {
        String(result.location.street.number) + ", " + result.location.street.name
    }
    
    var body: some View {
        VStack(alignment: .leading){
            briefDesc()
            .padding(.horizontal)
            if showLongDesc {
                longDesc()
                    .padding()
            } else {
                if result.selectionStatus == Constants.SelectionStatus.accepted {
                    acceptedStatus()
                        .padding(.top, 10)
                }
                if result.selectionStatus == Constants.SelectionStatus.declined {
                    declinedStatus()
                        .padding(.top, 10)
                }
                if (result.selectionStatus == nil) {
                    actionButtons()
                        .padding(.top, 10)
                }
            }
        }
        .padding(.top, 30)
    }
    
    // Brief User Description
    func briefDesc() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title2)
                    .bold()
                Text(shortDesc)
                    .font(.system(size: 20))
            }
            Spacer()
            Button {
                showLongDesc.toggle()
            } label: {
                Image(systemName: showLongDesc ? Constants.ActionButtonIcons.detailDownButton : Constants.ActionButtonIcons.detailUpButton )
                    .resizable()
                    .bold()
                    .frame(width: 20, height: 30)
                    .foregroundStyle(Color.black)
            }
        }
    }
    
    // Action Button
    func actionButtons() -> some View {
        HStack {
            Spacer()
            Button{
                modifySwiftData(selectionStatus: Constants.SelectionStatus.accepted)
                vm.apiCall(modelContext: modelContext)
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 150, height: 50)
                    .overlay {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 2)
                                .foregroundStyle(Color.black)
                            Text(Constants.ActionButtonIcons.acceptButton)
                                .font(.title2)
                                .bold()
                                .foregroundStyle(Color.white)
                        }
                    }
                    .foregroundStyle(Color.black)
            }
            Button{
                modifySwiftData(selectionStatus: Constants.SelectionStatus.declined)
                vm.apiCall(modelContext: modelContext)
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 150, height: 50)
                    .overlay {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 2)
                                .foregroundStyle(Color.black)
                            Text(Constants.ActionButtonIcons.declineButton)
                                .font(.title2)
                                .bold()
                                .foregroundStyle(Color.black)
                        }
                    }
                    .foregroundStyle(Color.white)
            }
            Spacer()
        }
    }
    
    // Accepted Status update
    func acceptedStatus() -> some View {
        HStack {
            Spacer()
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 250, height: 50)
                .overlay {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(Color.black)
                        Text(Constants.SelectionStatus.accepted)
                            .font(.title2)
                            .bold()
                            .foregroundStyle(Color.white)
                    }
                }
                .foregroundStyle(Color.black)
            Button{
                resetSwiftData()
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 50, height: 50)
                    .overlay {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 2)
                                .foregroundStyle(Color.black)
                            Image(systemName: Constants.ActionButtonIcons.resetButton)
                                .font(.title2)
                                .bold()
                                .foregroundStyle(Color.black)
                        }
                    }
                    .foregroundStyle(Color.white)
            }
            Spacer()
        }
    }
    
    // Declined Status update
    func declinedStatus() -> some View {
        HStack {
            Spacer()
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 250, height: 50)
                .overlay {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(Color.black)
                        Text(Constants.SelectionStatus.declined)
                            .font(.title2)
                            .bold()
                            .foregroundStyle(Color.white)
                    }
                }
                .foregroundStyle(Color.black)
            Button{
                resetSwiftData()
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 50, height: 50)
                    .overlay {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 2)
                                .foregroundStyle(Color.black)
                            Image(systemName: Constants.ActionButtonIcons.resetButton)
                                .font(.title2)
                                .bold()
                                .foregroundStyle(Color.black)
                        }
                    }
                    .foregroundStyle(Color.white)
            }
            Spacer()
        }
    }
    
    // Long description view
    func longDesc() -> some View {
        VStack(alignment: .leading) {
            Text(Constants.detailSections.gender)
                .font(.title2)
                .bold()
            Text(result.gender)
                .font(.system(size: 20))
                .padding(.bottom, 5)
            Text(Constants.detailSections.contactDetails)
                .font(.title2)
                .bold()
            Text(Constants.detailSections.phNo + result.cell)
                .font(.system(size: 20))
            Text(result.email)
                .font(.system(size: 20))
                .padding(.bottom, 5)
            Text(Constants.detailSections.address)
                .font(.title2)
                .bold()
            Text(result.location.city)
                .font(.system(size: 20))
            Text(result.location.state)
                .font(.system(size: 20))
            Text(result.location.country)
                .font(.system(size: 20))
            Text(String(result.location.postcode))
                .font(.system(size: 20))
                .padding(.bottom, 5)
        }
    }
    
    // Modify SwiftData
    func modifySwiftData(selectionStatus: String) {
        result.selectionStatus = selectionStatus
        modelContext.insert(result)
    }
    
    // Reset SwiftData
    func resetSwiftData() {
        result.selectionStatus = nil
        modelContext.insert(result)
    }
}
