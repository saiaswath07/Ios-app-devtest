
import Foundation

import SwiftUI


struct LinkView: View {
    let link: APIResponse.TopLink
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {

            
            VStack(alignment: .leading, spacing: 4) {
                
                HStack(content: {
                    
                    if let imageURL = URL(string: link.originalImage ?? "") {
                        AsyncImage(url: imageURL) { image in
                            image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            } placeholder: {
                                ProgressView()
                            }
                    } else {
                        Text(link.thumbnail ?? "x")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                    Text(link.title)
                        .font(.headline)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                    Text("\(link.totalClicks)")
                        .font(.headline).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                    
                })
                HStack(spacing: 4) {
                    Text("           ")
                    Text(link.timesAgo)
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text("•")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Spacer()
                    
                    Text("Clicks")
                        .font(.caption)
                        .foregroundColor(.gray)
                }

            Spacer()
            
            HStack(content: {
                Text(link.webLink)
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    
                Spacer()
                Button(action: {
                    // Handle copy action
                }, label: {
                    Image(systemName: "doc.on.doc")
                        .foregroundColor(.blue)
                })
            }).frame(width: .infinity)
                    .padding(5.0)
                    .background(Color(red: 0.65, green: 0.78, blue: 1).opacity(0.3))
                    .cornerRadius(5)
                    .overlay(
                      RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.50)
                        .stroke(Color.blue, style: StrokeStyle(lineWidth: 1,dash: [4, 4]))
                    )
        }
            
        
        }
        .padding(.horizontal)
        .background(Color(.white))
        .cornerRadius(8)
    }
}



struct Recent_LinkView: View {
    let link: APIResponse.RecentLink
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {

            
            VStack(alignment: .leading, spacing: 4) {
                
                HStack(content: {
                    
                    if let imageURL = URL(string: link.originalImage ?? "") {
                        AsyncImage(url: imageURL) { image in
                            image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            } placeholder: {
                                ProgressView()
                            }
                    } else {
                        Text(link.thumbnail ?? "x")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                    Text(link.title)
                        .font(.headline)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                    Text("\(link.totalClicks)")
                        .font(.headline).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                    
                })
                HStack(spacing: 4) {
                    Text("           ")
                    Text(link.timesAgo)
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text("•")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Spacer()
                    
                    Text("Clicks")
                        .font(.caption)
                        .foregroundColor(.gray)
                }

            Spacer()
            
            HStack(content: {
                Text(link.webLink)
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    
                Spacer()
                Button(action: {
                    // Handle copy action
                }, label: {
                    Image(systemName: "doc.on.doc")
                        .foregroundColor(.blue)
                })
            }).frame(width: .infinity)
                    .padding(5.0)
                    .background(Color(red: 0.65, green: 0.78, blue: 1).opacity(0.3))
                    .cornerRadius(5)
                    .overlay(
                      RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.50)
                        .stroke(Color.blue, style: StrokeStyle(lineWidth: 1,dash: [4, 4]))
                    )
        }
            
        
        }
        .padding(.horizontal)
        .background(Color(.white))
        .cornerRadius(8)
    }
}
