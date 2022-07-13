//
//  AuthResponse.swift
//  Spotify
//
//  Created by ikebbeh on 7/11/22.
//

import Foundation

struct AuthResponse: Codable {
    let access_token: String
    let expires_in: Int
    let refresh_token: String?
    let scope: String
    let tokenType: String
}


//{
//    "access_token" = "BQBMlDlU3ru7Ny9U6T8hCz2KwpcFibzBaMb08tXwiaX65-8qjC77OQwJ9mwLcxusSjsPJFu-g_kbE7hcDJIvVkeTPFNKFTnA4Qww1vlUuZ_lAHYNwkYxNAe5FZbrxpCx2gNvAPkEwAU9ozDwadSDOO_3Cto21Jy8mY3vBz8sIQTX_wz-y0skQogO4XDvSbumTgOz4F0fZz7BsXwTparAosg";
//    "expires_in" = 3600;
//    "refresh_token" = "AQCWIAIWlAeWPseAFsGVz5xYX_yRFed2sTcoJoFCthbj3IG7xLYGGq1sSqLtZUxsc06BzGzsdHGPOn4ZDqJZGJ5ZznEfOHNi8_2PrlAe9vOol6J369LfrTNq8YMZ4Fy7LT0";
//    scope = "user-read-private";
//    "token_type" = Bearer;
//}
