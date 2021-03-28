//
//  BookingView.swift
//  BookTheCoach
//
//  Created by Thanh Duy on 10/03/2021.
//

import SwiftUI

struct BookingView: View {
    @State var route: String
    @State var time: String
    @State var day: String
    @State var bookedSeat: [Int]
    @State var selectedSeat = [Int]()
    
    var rid: String
    
    @State private var showingHalfModalView = false
    
    @State private var sdt = ""
    @State private var name = ""
    
    @EnvironmentObject var userInfo: UserInfo
    @ObservedObject var post = BookingViewModel()
    
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
//            HStack {
//                Button(action: {
//                    presentationMode.wrappedValue.dismiss()
//                }, label: {
//                    Image(systemName: "chevron.left")
//                        .font(.title2)
//                        .foregroundColor(.green)
//
//                })
//
//                Spacer()
//            }
//            .overlay(
//                Text("Select Seats")
//                    .font(.title2)
//                    .fontWeight(.semibold)
//                    .foregroundColor(.green)
//            )
//            .padding()
//            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)

            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                //Curve or Thatre View
                
                GeometryReader { reader in
                    // To get width
                    
                    let width = reader.frame(in: .global).width
                    
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: 50))
                        
                        path.addCurve(to: CGPoint(x: width, y: 50), control1: CGPoint(x: width / 2, y: 0), control2: CGPoint(x: width / 2, y: 0))
                    }
                    .stroke(Color.gray, lineWidth: 1.5)
                }
                .frame(height: 50)
                .padding(.top, 100)
                .padding(.horizontal, 35)
                
                
                
                
                
                let seatLeft = 1..<11
                let seatRight = 11..<21
                
                HStack(spacing: 30) {
                    let colums = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
                    
                    LazyVGrid(columns: colums, spacing: 13, content: {
                        ForEach(seatLeft, id: \.self) { index in
                            
                            SeatView(seat: index, selectedSeats: $selectedSeat, bookedSeats: $bookedSeat)
                            
                            
                            
                        }
                    })
                    
                    LazyVGrid(columns: colums, spacing: 13, content: {
                        ForEach(seatRight, id: \.self) { index in
                            
                            SeatView(seat: index, selectedSeats: $selectedSeat, bookedSeats: $bookedSeat)

                            
                        }
                    })
                    
                }
                .padding()
                .padding(.top, 30)
                
                HStack(spacing: 15) {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.gray)
                        .frame(width: 20, height: 20)
                        .overlay(
                            Image(systemName: "xmark")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                        )
                    Text("Booked")
                        .font(.caption)
                        .foregroundColor(.green)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color("Color"), lineWidth: 2)
                        .frame(width: 20, height: 20)
                    
                    Text("Available")
                        .font(.caption)
                        .foregroundColor(.green)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color("Color"))
                        .frame(width: 20, height: 20)
                    
                    Text("Selected")
                        .font(.caption)
                        .foregroundColor(.green)
                }
                .padding(.top, 25)
                
                HStack {
                    Spacer()
                    Text("Date: ")
                        .fontWeight(.bold)
                    Text("\(day)")
                    
                    Spacer()
                    
                    Text("Gio: ")
                        .fontWeight(.bold)
                    Text("\(time)")
                    Spacer()
                    
                }
                .padding(.top, 25)
                .padding(.horizontal, 30)
                
                HStack {
                    Text("So ghe: ")
                        .fontWeight(.bold)
                    
                    Spacer()
                    HStack {
                        ForEach(selectedSeat.indices, id: \.self) {
                            Text("\(selectedSeat[$0])  ")
                        }
                        
                    }
                    
                    Spacer()
                }
                .padding(.top, 30)
                .padding(.horizontal, 30)
                    
                
                

                
                Button(action: {
                    self.showingHalfModalView.toggle()
                }, label: {
                    Text("Book The Ticket")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 20, height: 40)
                        .background(Color.purple)
                        .padding(.top, 40)
                })
                .disabled(selectedSeat.isEmpty == true)
                .opacity(selectedSeat.isEmpty == true ? 0.5: 1)
                
                Spacer(minLength: 0)
                
                
                
                
            })
            
            HalfModalView(isShown: $showingHalfModalView) {
                VStack {
                    TextField("Enter Your Name", text: $name)
                        .frame(width: UIScreen.main.bounds.width - 20)
                        .cornerRadius(6)
                    
                    TextField("Enter Your Phone", text: $sdt)
                        .frame(width: UIScreen.main.bounds.width - 20)
                        .cornerRadius(6)
                        .padding(.top, 10)
                    
                    Button(action: {
                                                
                        
                        self.post.postBookedSeats(rid: rid, bookedseat: selectedSeat)
                        self.post.postInfoid(day: day, email: self.userInfo.user.email, name: self.name, sdt: self.sdt, selectedseat: self.selectedSeat, time: time, route: route, rid: rid)
                        self.name = ""
                        self.sdt = ""
                        self.showingHalfModalView = false
                        
                        presentationMode.wrappedValue.dismiss()
                        
                        
                        

                        
                        
                    }, label: {
                        Text("Apply")
                            .fontWeight(.bold)
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - 20, height: 40)
                            .cornerRadius(6)
                            .background(Color.purple)
                        
                        
                    })
                    .disabled(name.isEmpty || sdt.isEmpty ? true: false)
                    .opacity(name.isEmpty || sdt.isEmpty ? 0.5: 1)
                    
                }
            }
        }
        .navigationTitle("Selected Seat")
    }
}

struct SeatView: View {
    var seat: Int
    @Binding var selectedSeats: [Int]
    @Binding var bookedSeats: [Int]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .stroke(bookedSeats.contains(seat) ? Color.gray : Color("Color"), lineWidth: 2)
                .frame(height: 40)
                .background(
                    selectedSeats.contains(seat) ? Color("Color") : Color.clear
                )
                
                //hiding those four fake seats
            if bookedSeats.contains(seat) {
                Image(systemName: "xmark")
                    .foregroundColor(.gray)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            //checking and add
            
            if selectedSeats.contains(seat){
                //removing
                selectedSeats.removeAll { (removeSeat) -> Bool in
                    return removeSeat == seat
                }
                return
            }
            print(seat)
            selectedSeats.append(seat)
            
        }
        .disabled(bookedSeats.contains(seat))

    }
}

