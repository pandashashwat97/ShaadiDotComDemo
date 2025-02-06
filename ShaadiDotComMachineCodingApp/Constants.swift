//
//  Constants.swift
//  ShaadiDotComMachineCodingApp
//
//  Created by Shashwat Panda on 06/02/25.
//

import Foundation


public enum Constants {
    public enum Url {
        public static let value = "https://randomuser.me/api/?results=10%60"
    }
    public enum SelectionStatus {
        public static let accepted = "accepted"
        public static let declined = "declined"
    }
    public enum Titles {
        public static let unseenProfiles = "shaadi.com 💍"
        public static let acceptedProfiles = "Accepted Profiles"
        public static let declinedProfile = "Declined Profiles"
    }
    public enum TabImages {
        public static let unseenProfiles = "house"
        public static let acceptedProfiles = "hand.thumbsup.fill"
        public static let declinedProfile = "hand.thumbsdown.fill"
    }
    public enum ActionButtonIcons {
        public static let acceptButton = "Accept"
        public static let declineButton = "Decline"
        public static let resetButton = "arrow.counterclockwise.circle"
        public static let detailUpButton = "square.and.arrow.up"
        public static let detailDownButton = "square.and.arrow.down"
    }
    public enum detailSections {
        public static let gender = "Gender"
        public static let contactDetails = "Contact Details"
        public static let phNo = "Ph no: "
        public static let address = "Address"
    }
}
