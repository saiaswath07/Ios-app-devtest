import SwiftUI
import Combine
import Charts


struct ContentView: View {
    @StateObject private var dataFetcher = DataFetcher()
    @State private var selectedTab: Tab = .topLinks
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor.white
    }

    var body: some View {
        nav_tab
        
    }
    
    
    var main_view:some View {
        ScrollView {
            header_view
            
            VStack(content: {
                
                Spacer(minLength: 10)
                greeting_view
                
                show_graph
                Spacer(minLength: 30)
                horz_cards
                Spacer(minLength: 30)
                analytics_button
                Spacer(minLength: 40)
                tabs_view
                Spacer()
                if selectedTab == .topLinks {
                    top_links_view
                } else {
                    recent_links_view
                }
                
                Spacer()
                view_all_links_button
                Spacer(minLength: 40)
                talk_with_us_button
                Spacer()
                FAQ_button
                  
            })
            .frame(height: .infinity)
            .padding()
            .background(Color(red:0.95, green:0.95, blue:0.95))
            .cornerRadius(30)
        }
        .background(Color(red: 0.05, green: 0.44, blue: 1))
    }
    
    
    var top_links_view:some View {
        VStack(alignment: .leading, spacing: 16) {
                        // ...

                        if let fetchedData = dataFetcher.fetchedData,
                           let recentLinks = fetchedData.data?.topLinks,
                           !recentLinks.isEmpty {
                            
                            ForEach(Array(recentLinks.prefix(4)), id: \.urlId) { link in
                                LinkView(link: link)
                            }
                        }
            else{
                Text("Loading...")
            }
                    }
                    .padding()
    }
    
    var recent_links_view:some View {
        VStack(alignment: .leading, spacing: 16) {
                        // ...

                        if let fetchedData = dataFetcher.fetchedData,
                           let recentLinks = fetchedData.data?.recentLinks,
                           !recentLinks.isEmpty {
                            
                            ForEach(Array(recentLinks.prefix(4)), id: \.urlId) { link in
                                Recent_LinkView(link: link)
                            }
                        }
            else{
                Text("Loading...")
            }
                    }
                    .padding()
    }
    
    
    var tabs_view:some View{
        VStack(content: {
            HStack(content: {
                Button(action: {
                    selectedTab = .topLinks
                }) {
                    Text("Top Links")
                        .foregroundColor(selectedTab == .topLinks ? .white : Color(red: 0.60, green: 0.61, blue: 0.63))
                                                .font(.headline)
                                                .padding(.horizontal, 16)
                                                .padding(.vertical, 8)
                                                .background(selectedTab == .topLinks ? Color.blue : Color.clear)
                                                .cornerRadius(20)
                }
                Spacer()
                
                Button(action: {
                    selectedTab = .recentLinks
                }) {
                    Text("Recent Links")
                        .foregroundColor(selectedTab == .recentLinks ? .white : Color(red: 0.60, green: 0.61, blue: 0.63))
                                                .font(.headline)
                                                .padding(.horizontal, 16)
                                                .padding(.vertical, 8)
                                                .background(selectedTab == .recentLinks ? Color.blue : Color.clear)
                                                .cornerRadius(20)
                }
                Spacer()
                
                Button(action: {
//                    search action
                }) {
                    VStack(content: {
                    Image(systemName: "magnifyingglass")
                        .font(.headline)
                        .foregroundColor(.gray)
                }).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                        .background(Color(red: 1, green: 1, blue: 1, opacity: 0.12))
                        .cornerRadius(10)
                    Text("")
                    
                }
            })
        })
    }
    
    
    var greeting_view: some View{
        VStack(content: {
        
        Text("\(greetingMessage)")
            .font(.system(size: 16))
            .foregroundColor(Color(red: 0.60, green: 0.61, blue: 0.63))
            .frame(maxWidth: .infinity, alignment: .leading)
        Spacer()
        HStack(content: {
            ZStack(content: {
                Text("Ajay Manva")
                    .font(.system(size: 24))
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(.wavehandicon)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).padding(.trailing, 50.0)
            })

        })
        })
    }

    var header_view: some View{
        VStack(content: {
            Spacer(minLength: 10)
            HStack(content: {
                Text("Dashboard")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                    .padding(.leading)
                Spacer()
                VStack(content: {
                    Image(.gareicon)
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .font(.system(size: 26))
                        
                }).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    .background(Color(red: 1, green: 1, blue: 1, opacity: 0.12))
                    .cornerRadius(10)
                
                Text(" ")

            })
            Spacer(minLength: 30)
        })
    }
    
    var courses_tab_view: some View{
        VStack(content: {
            Text("Courses tab")
        })
    }
    
    var plus_tab_view: some View{
        VStack(content: {
            Text("+ tab")
        })
    }
    
    var campaigns_tab_view: some View{
        VStack(content: {
            Text("Campaigns tab")
        })
    }
    
    var profile_tab_view: some View{
        VStack(content: {
            Text("profile tab")
        })
    }
    
    var nav_tab: some View{
        
        TabView {
            main_view
                .tabItem{
                    Label("Links", systemImage: "link")
                }
            courses_tab_view
                .tabItem{
                    Label("Links", image: .openbook)
                }
                
            plus_tab_view
                .tabItem{
                    Label("Links", image: .plusIcon)
                }
            
            campaigns_tab_view
                .tabItem{
                    Label("Links", image: .spakerIcon)
                }
            
            profile_tab_view
                .tabItem{
                    Label("Links", image: .profileIcon)
                }
            
            
            
        }
    }
    
    var analytics_button: some View {
        HStack(content: {
            ZStack(content: {
                Image(.priceBoost)
                    .resizable()
                    .frame(width: 25,height: 20)
            }).frame(width: 32, height: 32)
            Text("View Analytics")
                .font(.system(size: 16).weight(.semibold))
                .lineSpacing(24)
                .foregroundColor(.black)
        })
            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                .frame(width: 328, height: 48)
                .cornerRadius(8)
                .overlay(
                  RoundedRectangle(cornerRadius: 8)
                    .inset(by: 0.50)
                    .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 0.50)
                )
    }
    
    var view_all_links_button: some View {
        HStack(content: {
            ZStack(content: {
                Image(systemName: "link")
                    .resizable()
                    .frame(width: 25,height: 20)
            }).frame(width: 32, height: 32)
            Text("View all Links")
                .font(.system(size: 16).weight(.semibold))
                .lineSpacing(24)
                .foregroundColor(.black)
        })
            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                .frame(width: 328, height: 48)
                .cornerRadius(8)
                .overlay(
                  RoundedRectangle(cornerRadius: 8)
                    .inset(by: 0.50)
                    .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 0.50)
                )
    }
    
    var talk_with_us_button: some View {
        HStack(content: {
            ZStack(content: {
                Image(.waIcon)
                    .resizable()
                    .frame(width: 25,height: 20)
            }).frame(width: 32, height: 32)
            Text("Talk with us")
                .font(.system(size: 16).weight(.semibold))
                .lineSpacing(24)
                .foregroundColor(.black)
        })
            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
            .frame(width: 328, height: 48,alignment: .leading)
            .background(Color(red: 0.29, green: 0.82, blue: 0.37).opacity(0.2))
                .cornerRadius(8)
                .overlay(
                  RoundedRectangle(cornerRadius: 8)
                    .inset(by: 0.50)
                    .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 0.50)
                )
    }
    
    var FAQ_button: some View {
        HStack(content: {
            ZStack(content: {
                Image(.qmark)
                    .resizable()
                    .frame(width: 25,height: 20)
            }).frame(width: 32, height: 32)
            Text("View all Links")
                .font(.system(size: 16).weight(.semibold))
                .lineSpacing(24)
                .foregroundColor(.black)
        })
            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
            .frame(width: 328, height: 48,alignment: .leading)
                .background(Color(red: 0.05, green: 0.44, blue: 1).opacity(0.2))
                .cornerRadius(8)
                .overlay(
                  RoundedRectangle(cornerRadius: 8)
                    .inset(by: 0.50)
                    .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 0.50)
                )
    }

    
    var horz_cards: some View{
//        "\(fetchedData.todayClicks)")
//fetchedData.topLocation
//fetchedData.topSource
//        fetchedData.startTime
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                
                if let fetchedData = dataFetcher.fetchedData {
                    VStack(content: {
                        VStack(content: {
                            Image(.icon1)
                                .resizable()
                                .frame(width: 40,height: 40,alignment: .leading)
                                .padding(.leading)
                        })
//                        .background(.red)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                        
                        VStack(content: {
                            Text("\(fetchedData.todayClicks)")
                        })
                        .padding(.top, 10.0)
                        .padding(.bottom, 10.0)
                        .font(.system(size: 16).weight(.semibold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10.0)
                        
                        VStack(content: {
                            Text("Today's clicks")
                        }).font(.system(size: 14))
                            .foregroundColor(Color(red: 0.60, green: 0.61, blue: 0.63))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10.0)
                        
                    })  .frame(width: 120, height: 120)
                        .background(.white)
                        .cornerRadius(8)
                    
                    
                    VStack(content: {
                        VStack(content: {
                            Image(.icon2)
                                .resizable()
                                .frame(width: 40,height: 40,alignment: .leading)
                                .padding(.leading)
                        })
//                        .background(.red)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                        
                        VStack(content: {
                            Text(fetchedData.topLocation)
                        })
                        .padding(.top, 10.0)
                        .padding(.bottom, 10.0)
                        .font(.system(size: 16).weight(.semibold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10.0)
                        
                        VStack(content: {
                            Text("Top Location")
                        }).font(.system(size: 14))
                            .foregroundColor(Color(red: 0.60, green: 0.61, blue: 0.63))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10.0)
                        
                    })  .frame(width: 120, height: 120)
                        .background(.white)
                        .cornerRadius(8)
                    
                    
                    VStack(content: {
                        VStack(content: {
                            Image(.icon3)
                                .resizable()
                                .frame(width: 40,height: 40,alignment: .leading)
                                .padding(.leading)
                        })
//                        .background(.red)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                        
                        VStack(content: {
                            Text(fetchedData.topSource)
                        })
                        .padding(.top, 10.0)
                        .padding(.bottom, 10.0)
                        .font(.system(size: 16).weight(.semibold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10.0)
                        
                        VStack(content: {
                            Text("Top source")
                        }).font(.system(size: 14))
                            .foregroundColor(Color(red: 0.60, green: 0.61, blue: 0.63))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10.0)
                        
                    })  .frame(width: 120, height: 120)
                        .background(.white)
                        .cornerRadius(8)
                    
                    VStack(content: {
                        VStack(content: {
                            Image(.icon4)
                                .resizable()
                                .frame(width: 40,height: 40,alignment: .leading)
                                .padding(.leading)
                        })
//                        .background(.red)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                        
                        VStack(content: {
                            Text(fetchedData.startTime)
                        })
                        .padding(.top, 10.0)
                        .padding(.bottom, 10.0)
                        .font(.system(size: 16).weight(.semibold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10.0)
                        
                        VStack(content: {
                            Text("Best Time")
                        }).font(.system(size: 14))
                            .foregroundColor(Color(red: 0.60, green: 0.61, blue: 0.63))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10.0)
                        
                    })  .frame(width: 120, height: 120)
                        .background(.white)
                        .cornerRadius(8)
                    
                }
            }
        }
        
    }
    
    
    var show_graph: some View{
        
        VStack(content: {
            Spacer()
            HStack(content: {
                Text("Overview")
                    .font(.system(size: 14))
                    .foregroundColor(Color(red: 0.60, green: 0.61, blue: 0.63))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("22 Aug - 23 Sept \(Image(systemName: "clock"))")
                    .font(.system(size: 12))
                    .padding(.all, 10.0)
                    .overlay( RoundedRectangle(cornerRadius: 7)
                        .stroke(Color(red: 0.60, green: 0.61, blue: 0.63), lineWidth: 2))
            })
            VStack(alignment: .leading, spacing: 16) {
                if let fetchedData = dataFetcher.fetchedData,
                                   let overallUrlChart = fetchedData.data?.overallUrlChart {
                                    let chartData = overallUrlChart.values.map { Double($0) }
                                    ChartView(data: chartData)
                                }else {
                                    Text("Loading...")
                                }
                        } 
                        .padding()
            
            
        })
        .padding()
        .background(.white)
        .cornerRadius(10)
        
    }
    

    private var greetingMessage: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 6..<12: return "Good Morning"
        case 12..<17: return "Good Afternoon"
        case 17..<22: return "Good Evening"
        default: return "Good Night"
        }
    }
    enum Tab {
        case topLinks, recentLinks
    }
}

#Preview {
    ContentView()
}
