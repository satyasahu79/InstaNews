//
//  ContentView.swift
//  iCloud&InAppPurchase
//
//  Created by Satya Prakash Sahu on 31/05/22.
//

import SwiftUI
import AudioToolbox
import FirebaseAuth


struct SignupView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var editingEmailTextfield: Bool = false
    @State private var editingPasswordTextfield: Bool = false
    
    @State private var emailIconBounce: Bool = false
    @State private var passwordIconBounce: Bool = false
    
    
    
    private let generator = UISelectionFeedbackGenerator()
    
    @State private var showProfileView : Bool = false
    @State private var signupToggle: Bool = true
    
    @State private var rotationAngle = 0.0
    
    //    @State private var signInWithAppleObject = SignInWithAppleObject()
    
    @State private var fadeToogle : Bool = true
    
    
    @State private var showAlertView: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Account.userSince, ascending: true)], animation: .default) private var savedAccounts: FetchedResults<Account>
    
    var body: some View {
        ZStack {
            Image(signupToggle ? "background-3" : "background-1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .opacity(fadeToogle ? 1:0)
            
            ZStack {
                
                
                Color("secondaryBackground")
                    .edgesIgnoringSafeArea(.all)
                    .opacity(fadeToogle ? 0 : 1)
                
                
                VStack {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(signupToggle ? "Sign up" : "Sign in")
                            .font(Font.largeTitle.bold())
                            .foregroundColor(.white)
                        Text("Access to 120+ hours of courses, tutorials, and livestreams")
                            .font(.subheadline)
                            .foregroundColor(Color.white.opacity(0.7))
                        
                        HStack(spacing: 12.0) {
                            TextfieldIcon(iconName: "envelope.open.fill", currentlyEditing: $editingEmailTextfield, passedImage: .constant(nil))
                                .scaleEffect(emailIconBounce ? 1.2 : 1.0)
                            TextField("Email", text: $email) { isEditing in
                                editingEmailTextfield = isEditing
                                editingPasswordTextfield = false
                                generator.selectionChanged()
                                
                                if isEditing {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                                        emailIconBounce.toggle()
                                    }
                                    DispatchQueue.main.asyncAfter(deadline : .now() + 0.25) {
                                        withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                                            emailIconBounce.toggle()
                                        }
                                    }
                                    
                                }
                            }
                            .colorScheme(.dark)
                            .foregroundColor(Color.white.opacity(0.7))
                            .autocapitalization(.none)
                            .textContentType(.emailAddress)
                        }
                        //                                        .padding(.horizontal)
                        .frame(height: 52)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 1.0)
                                .blendMode(.overlay)
                        )
                        .background(
                            Color("secondaryBackground")
                                .cornerRadius(16.0)
                                .opacity(0.8)
                        )
                        
                        // Email Section Ends
                        
                        HStack(spacing: 12.0) {
                            TextfieldIcon(iconName: "key.fill", currentlyEditing: $editingPasswordTextfield, passedImage: .constant(nil))
                                .scaleEffect(passwordIconBounce ? 1.2 : 1.0)
                            
                            SecureField("Password", text: $password)
                                .colorScheme(.dark)
                                .foregroundColor(Color.white.opacity(0.7))
                                .autocapitalization(.none)
                                .textContentType(.password)
                                .onTapGesture {
                                    editingPasswordTextfield = true
                                    editingEmailTextfield = false
                                    
                                    if editingPasswordTextfield {
                                        generator.selectionChanged()
                                        withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                                            passwordIconBounce.toggle()
                                        }
                                    }
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now()+0.25) {
                                        withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                                            passwordIconBounce.toggle()
                                        }
                                    }
                                    
                                }
                        }
                        //                                        .padding(.horizontal)
                        .frame(height: 52)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 1.0)
                                .blendMode(.overlay)
                        )
                        .background(
                            Color("secondaryBackground")
                                .cornerRadius(16.0)
                                .opacity(0.8)
                        )
                        
                        // Password Section Ends
                        
                        
                        // SignUp Section Starts
                        
                        GradientButton(buttonTitle: signupToggle ? "Create account" : "Sign in") {
                            generator.selectionChanged()
                            signup()
                        }
                        .onAppear {
                            Auth.auth().addStateDidChangeListener { auth, user in
                                if let currentUser = user {
                                    if savedAccounts.count == 0 {
                                        // Add data to Core Data
                                        let userDataToSave = Account(context: viewContext)
                                        userDataToSave.name = currentUser.displayName
                                        userDataToSave.bio = nil
                                        userDataToSave.userID = currentUser.uid
                                        userDataToSave.numberOfCertificates = 0
                                        userDataToSave.proMember = false
                                        userDataToSave.twitterHandle = nil
                                        userDataToSave.website = nil
                                        userDataToSave.profileImage = nil
                                        userDataToSave.userSince = Date()
                                        do  {
                                            try viewContext.save()
                                            DispatchQueue.main.async    {
                                                showProfileView.toggle()
                                            }
                                        }   catch let error {
                                            alertTitle = "Could not create an account"
                                            alertMessage = error.localizedDescription
                                            showAlertView.toggle()
                                        }
                                    }   else {
                                        showProfileView.toggle()
                                    }
                                }
                            }
                        }
                        
                        
                        // SignUp Section Ends
                        
                        
                        // Terms and Conditions section starts
                        
                        if signupToggle {
                            Text("By clicking on Sign up, you agree to our Terms of service and Privacy policy")
                                .font(.footnote)
                                .foregroundColor(Color.white.opacity(0.7))
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color.white.opacity(0.1))
                        }
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.35)){
                                    fadeToogle.toggle()
                                    DispatchQueue.main.asyncAfter(deadline: .now()+0.35) {
                                        withAnimation(.easeInOut(duration: 0.35)){
                                            fadeToogle.toggle()
                                        }
                                    }
                                }
                                withAnimation(.easeInOut(duration: 0.7)) {
                                    signupToggle.toggle()
                                    self.rotationAngle += 180
                                }
                                
                            }, label: {
                                HStack(spacing: 4) {
                                    Text(signupToggle ? "Already have an account?" : "Don't have an account?")
                                        .font(.footnote)
                                        .foregroundColor(Color.white.opacity(0.7))
                                    GradientText(text: signupToggle ? "Sign in" : "Sign up")
                                        .font(Font.footnote.bold())
                                }
                                
                                
                                
                                
                            })
                            
                            if !signupToggle    {
                                Button(action: {
                                    sendPasswordResetEmail()
                                }, label: {
                                    
                                    HStack(spacing: 4) {
                                        Text("Forgot password?")
                                            .font(.footnote)
                                            .foregroundColor(.white.opacity(0.7))
                                        GradientText(text: "Reset password")
                                            .font(.footnote.bold())
                                    }
                                    
                                    
                                })  // Button Ends
                                
                                //                            Rectangle()
                                //                                .frame(height: 1)
                                //                                .foregroundColor(.white.opacity(0.1))
                                //
                                //
                                //                            Button(action: {
                                //                            signInWithAppleObject.signInWithApple()
                                //                        }, label: {
                                //                            SignInWithAppleButton()
                                //                                .frame(height: 50)
                                //                                .cornerRadius(16)
                                //                        })
                                
                            }
                            
                            
                            
                            
                            
                            
                            
                            
                        }   // VStack Ends
                        
                        
                    }
                    .padding(20)
                }
                .rotation3DEffect(Angle(degrees: self.rotationAngle), axis: (x : 0, y : 1, z:0))
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.white.opacity(0.2))
                        .background(Color("secondaryBackground").opacity(0.5))
                        .background(VisualEffectBlur(blurStyle: .systemThinMaterialDark))
                        .shadow(color: Color("shadowColor").opacity(0.5), radius: 60, x: 0, y: 30)
                )
                .cornerRadius(30.0)
                .padding(.horizontal)
                .rotation3DEffect(Angle(degrees: self.rotationAngle), axis: (x : 0, y : 1, z:0))
                .alert(isPresented: $showAlertView) {
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
                
                
                
                
            }
            
            
        } .fullScreenCover(isPresented: $showProfileView) {
            ProfileView()
                .environment(\.managedObjectContext, self.viewContext)
        }
        
    }
    
    
    
    
    
    // Firebase Functions
    
    func signup() {
        if signupToggle {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                guard error == nil else {
                    self.alertTitle = "Uh-oh!"
                    self.alertMessage = (error!.localizedDescription)
                    self.showAlertView.toggle()
                    return
                }
            }
        } else {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                guard error == nil else {
                    alertTitle = "Uh-oh!"
                    alertMessage = (error!.localizedDescription)
                    showAlertView.toggle()
                    return
                }
            }
        }
    }
    
    func sendPasswordResetEmail() {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            guard error == nil else {
                alertTitle = "Uh-oh!"
                alertMessage = (error!.localizedDescription)
                showAlertView.toggle()
                return
            }
            alertTitle = "Password Reset Email is Sent"
            alertMessage = "Check your inbox for an email to reset your password."
            showAlertView.toggle()
        }
    }
    
    
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
            .preferredColorScheme(.dark)
    }
}

