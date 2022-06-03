//
//  ProfileView.swift
//  iCloud&InAppPurchase
//
//  Created by Satya Prakash Sahu on 01/06/22.
//

import SwiftUI
import FirebaseAuth
import CoreData


struct ProfileView1: View {
    
    
    var body: some View{
        Text("Profile")
    }
    
//    @Environment(\.presentationMode) var presentationMode
//
//
//    @State private var planPurchased: Bool = false
//
//    @State private var showAlertView: Bool = false
//
//    @State private var alertTitle: String = ""
//    @State private var alertMessage: String = ""
//
////    @Binding var showOnboarding : Bool
//
//    @State private var showSettingsView: Bool = false
//    @State private var updater : Bool = true
//
//    @Environment(\.managedObjectContext) private var viewContext
////    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Account.userSince, ascending: true)], predicate: NSPredicate(format: "userID == %@", Auth.auth().currentUser!.uid), animation: .default) private var savedAccounts: FetchedResults<Account>
//
//    @State private var currentAccount: Account?
//
//    var body: some View {
//
//        ZStack{
//            ZStack {
//                Image("background-2")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .edgesIgnoringSafeArea(.all)
//
//
//                VStack {
//                    VStack(alignment: .leading, spacing: 16) {
//                        HStack(spacing: 16) {
//
//                            if currentAccount?.profileImage != nil  {
//                                GradientProfilePictureView(profilePicture: UIImage(data: currentAccount!.profileImage!)!)
//                                    .frame(width: 66, height: 66)
//                            }   else {
//                                ZStack {
//                                    Circle()
//                                        .foregroundColor(Color("pink-gradient-1"))
//                                        .frame(width: 66, height: 66, alignment: .center)
//                                    Image(systemName: "person.fill")
//                                        .foregroundColor(.white)
//                                        .font(.system(size: 24, weight: .medium, design: .rounded))
//                                }
//                                .frame(width: 66, height: 66, alignment: .center)
//                            }
//
//
//
//
//
//                            VStack(alignment: .leading) {
//                                Text(currentAccount?.name ?? "No Name")
//                                    .foregroundColor(.white)
//                                    .font(.title2)
//                                    .bold()
//                                Text("View profile")
//                                    .foregroundColor(.white.opacity(0.7))
//                                    .font(.footnote)
//                            }
//
//
//                            //                            NavigationLink {
//                            //                                SettingsView()
//                            //                            } label: {
//                            //                                TextfieldIcon(iconName: "gearshape.fill", currentlyEditing: .constant(true))
//                            //                            }
//
//
//                            Button(action: {
//                                showSettingsView.toggle()
//
//                            }, label: {
//                                TextfieldIcon(iconName: "gearshape.fill", currentlyEditing: .constant(true), passedImage: .constant(nil))
//                            })
//
//                        }
//
//                        Rectangle()
//                            .frame(height: 1)
//                            .foregroundColor(.white.opacity(0.1))
//
//                        Text(currentAccount?.bio ?? "No Bio")
//                            .foregroundColor(.white)
//                            .font(.title2.bold())
//
//                        if currentAccount?.numberOfCertificates != 0 {
//                            Label("Awarded \(currentAccount?.numberOfCertificates ?? 0) certificates since \(currentAccount?.userSince ?? Date())", systemImage: "calendar")
//                                .foregroundColor(.white.opacity(0.7))
//                                .font(.footnote)
//                        }
//
//
//
//                        Rectangle()
//                            .frame(height: 1)
//                            .foregroundColor(.white.opacity(0.1))
//
//                        HStack(spacing: 16) {
//                            if currentAccount?.twitterHandle != nil {
//                                Image("Twitter")
//                                    .resizable()
//                                    .foregroundColor(.white.opacity(0.7))
//                                    .frame(width: 24, height: 24, alignment: .center)
//                            }
//
//                            if currentAccount?.website != nil {
//                                Image(systemName: "link")
//                                    .foregroundColor(.white.opacity(0.7))
//                                    .font(.system(size: 17, weight: .semibold, design: .rounded))
//                                Text(currentAccount?.website ?? "No website")
//                                    .foregroundColor(.white.opacity(0.7))
//                                    .font(.footnote)
//                            }
//                        }
//
//                    }
//                    .padding(16)
//
//                    GradientButton(buttonTitle: planPurchased ? "Purchase Successful": "Purchase Lifetime Pro Plan") {
//                        withAnimation(.easeInOut) {
//                            planPurchased = true
//
//                            showAlertView.toggle()
//                            alertTitle = "Purchase Successful"
//                            alertMessage = "You are now a pro member"
//
//                        }
//
//
//
//
//
//                        //                        Purchases.shared.offerings { offerings, error in
//                        //                            if let packages = offerings?.current?.availablePackages {
//                        //                                Purchases.shared.purchasePackage(packages.first!) { transaction, purchaserInfo, error, userCancelled in
//                        //                                    print("TRANSACTION: \(transaction)")
//                        //                                    print("PURCHASER INFO: \(purchaserInfo)")
//                        //                                    print("ERROR: \(error)")
//                        //                                    print("USER CANCLLED: \(userCancelled)")
//                        //                                }
//                        //                            } else {
//
//                        //                            }
//                        //                        }
//                    }
//                    .padding(.bottom,8)
//
//
//                    .disabled(planPurchased)
//
//
//
//
//                    .padding(.horizontal, 16)
//
//                    Button(action: {
//                        withAnimation(.easeInOut) {
//                            planPurchased = false
//                            alertTitle = "Restore Successful"
//                            alertMessage = "Your purchase has been restored."
//                            showAlertView.toggle()
//                        }
//                    }, label: {
//                        GradientText(text: "Restore Purchases")
//                            .font(.footnote.bold())
//                    })
//                    .padding(.bottom)
//                    .disabled(!planPurchased)
//
//
//
//                }
//                .padding(.bottom)
//
//                .background(
//                    RoundedRectangle(cornerRadius: 30, style: .continuous)
//                        .stroke(Color.white.opacity(0.2))
//                        .background(Color("secondaryBackground").opacity(0.5))
//                        .background(VisualEffectBlur(blurStyle: .dark))
//                        .shadow(color: Color("shadowColor").opacity(0.5), radius: 60, x: 0, y: 30)
//                )
//                .cornerRadius(30)
//                .padding(.horizontal)
//
//
//                VStack {
//                    Spacer()
//                    Button(action: {
//                        signout()
////                        showOnboarding.toggle()
//                    }, label: {
//                        Image(systemName: "arrow.turn.up.forward.iphone.fill")
//                            .foregroundColor(.white)
//                            .font(.system(size: 15, weight: .medium, design: .rounded))
//                            .rotation3DEffect(
//                                Angle(degrees: 180),
//                                axis: (x: 0.0, y: 0.0, z: 1.0)
//                            )
//                            .background(
//                                Circle()
//                                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
//                                    .frame(width: 42, height: 42, alignment: .center)
//                                    .overlay(
//                                        VisualEffectBlur(blurStyle: .dark)
//                                            .cornerRadius(21)
//                                            .frame(width: 42, height: 42, alignment: .center)
//                                    )
//                            )
//                    })
//                }
//                .padding(.bottom, 64)
//
//
//
//
//            }
//            .colorScheme(updater ? .dark : .dark)
//            .alert(isPresented: $showAlertView) {
//                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
//            }
//            .sheet(isPresented: $showSettingsView) {
//                SettingsView()
//                    .environment(\.managedObjectContext, self.viewContext)
//                    .onDisappear(){
//                        currentAccount = savedAccounts.first!
//                        updater.toggle()
//                    }
//            }
//            .onAppear() {
//                currentAccount = savedAccounts.first
//
//                if currentAccount == nil {
//                    let userDataToSave = Account(context: viewContext)
//                    userDataToSave.name = Auth.auth().currentUser!.displayName
//                    userDataToSave.bio = nil
//                    userDataToSave.userID = Auth.auth().currentUser!.uid
//                    userDataToSave.numberOfCertificates = 0
//                    userDataToSave.proMember = false
//                    userDataToSave.twitterHandle = nil
//                    userDataToSave.website = nil
//                    userDataToSave.profileImage = nil
//                    userDataToSave.userSince = Date()
//                    do {
//                        try viewContext.save()
//                    } catch let error {
//                        alertTitle = "Could not create an account"
//                        alertMessage = error.localizedDescription
//                        showAlertView.toggle()
//                    }
//                }
//            }
//
//
//        }
//    }
//
//    func signout() {
//        do {
//            try Auth.auth().signOut()
//            presentationMode.wrappedValue.dismiss()
//        } catch let error {
//            alertTitle = "Uh-Oh!"
//            alertMessage = error.localizedDescription
//            showAlertView.toggle()
//        }
//    }
    
}

struct ProfileView1_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView1( )
    }
}
