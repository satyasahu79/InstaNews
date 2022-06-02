//
//  SettingsView.swift
//  iCloud&InAppPurchase
//
//  Created by Satya Prakash Sahu on 02/06/22.
//

import SwiftUI
import CoreData
import FirebaseAuth

struct SettingsView: View {
    
    @State private var editingNameTextfield = false
    @State private var editingTwitterTextfield = false
    @State private var editingSiteTextfield = false
    @State private var editingBioTextfield = false
    
    @State private var nameIconBounce = false
    @State private var twitterIconBounce = false
    @State private var siteIconBounce = false
    @State private var bioIconBounce = false
    
    @State private var name = ""
    @State private var twitter = ""
    @State private var site = ""
    @State private var bio = ""
    
    @State private var showImagePicker = false
    @State private var inputImage: UIImage?
    
    @State private var showAlertView: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Account.userSince, ascending: true)], predicate: NSPredicate(format: "userID == %@", Auth.auth().currentUser!.uid), animation: .default) private var savedAccounts: FetchedResults<Account>
    @State private var currentAccount: Account?
    
    private let generator = UISelectionFeedbackGenerator()
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.largeTitle.bold())
                    .padding(.top)
                Text("Manage your Design+Code profile and account")
                    .foregroundColor(.white.opacity(0.7))
                    .font(.callout)
                
                
                // Photo
                
                Button {
                    self.showImagePicker = true
                } label: {
                    HStack(spacing: 12) {
                        TextfieldIcon(iconName: "person.crop.circle", currentlyEditing: .constant(false), passedImage: $inputImage)
                        GradientText(text: "Choose Photo")
                        Spacer()
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white.opacity(0.1), lineWidth: 1)
                    )
                    .background(
                        Color.init(red: 26/255, green: 20/255, blue: 51/255)
                            .cornerRadius(16)
                    )
                }
                
                // Name Textfield
                GradientTextField(editingTextfield: $editingNameTextfield, textfieldString: $name, iconBounce: $nameIconBounce, textfieldPlaceholder: "Name", textfieldIconString: "textformat.alt")
                    .autocapitalization(.words)
                    .textContentType(.name)
                    .disableAutocorrection(true)
                
                
                // Twitter Handle Textfield
                GradientTextField(editingTextfield: $editingTwitterTextfield, textfieldString: $twitter, iconBounce: $twitterIconBounce, textfieldPlaceholder: "Twitter Handle", textfieldIconString: "at")
                    .autocapitalization(.none)
                    .keyboardType(.twitter)
                    .disableAutocorrection(true)
                
                // Site Textfield
                GradientTextField(editingTextfield: $editingSiteTextfield, textfieldString: $site, iconBounce: $siteIconBounce, textfieldPlaceholder: "Website", textfieldIconString: "link")
                    .autocapitalization(.none)
                    .keyboardType(.webSearch)
                    .disableAutocorrection(true)
                
                // Bio Textfield
                GradientTextField(editingTextfield: $editingBioTextfield, textfieldString: $bio, iconBounce: $bioIconBounce, textfieldPlaceholder: "Bio", textfieldIconString: "text.justifyleft")
                    .autocapitalization(.sentences)
                    .keyboardType(.default)
                
                GradientButton(buttonTitle: "Save Settings") {
                    // Save changes to Core Data
                    generator.selectionChanged()
                    
                    currentAccount?.name = self.name
                    currentAccount?.bio = self.bio
                    currentAccount?.twitterHandle = self.twitter
                    currentAccount?.website = self.site
                    currentAccount?.profileImage = self.inputImage?.pngData()
                    do {
                        try viewContext.save()
                        
                        // Present alert
                        alertTitle = "Settings Saved!"
                        alertMessage = "Your changes have been saved"
                        showAlertView.toggle()
                    } catch let error {
                        // Present error
                        alertTitle = "Uh-oh!"
                        alertMessage = error.localizedDescription
                        showAlertView.toggle()
                    }
                    
                }
                Spacer()
                
            }
            
            
            .padding()
            Spacer()
        }
        .background(Color("settingsBackground").edgesIgnoringSafeArea(.all))
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$inputImage)
        }
        .onAppear() {
            currentAccount = savedAccounts.first!
            self.name = currentAccount?.name ?? ""
            self.bio = currentAccount?.bio ?? ""
            self.twitter = currentAccount?.twitterHandle ?? ""
            self.site = currentAccount?.website ?? ""
            self.inputImage = UIImage(data: currentAccount?.profileImage ?? Data())
        }
        .alert(isPresented: $showAlertView, content: {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
