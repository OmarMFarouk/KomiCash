# Diff Details

Date : 2024-05-10 04:08:50

Directory d:\\komiwall-master\\komiwall-master

Total : 43 files,  1694 codes, -38 comments, 84 blanks, all 1740 lines

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [android/app/build.gradle](/android/app/build.gradle) | Gradle | 1 | 2 | 0 | 3 |
| [android/app/google-services.json](/android/app/google-services.json) | JSON | 29 | 0 | 0 | 29 |
| [android/app/src/main/AndroidManifest.xml](/android/app/src/main/AndroidManifest.xml) | XML | 9 | 0 | 9 | 18 |
| [android/app/src/main/res/mipmap-anydpi-v26/ic_launcher.xml](/android/app/src/main/res/mipmap-anydpi-v26/ic_launcher.xml) | XML | 5 | 0 | 0 | 5 |
| [android/settings.gradle](/android/settings.gradle) | Gradle | 1 | 2 | 0 | 3 |
| [firebase.json](/firebase.json) | JSON | 1 | 0 | 0 | 1 |
| [lib/blocs/auth_bloc/auth_bloc/auth_cubit.dart](/lib/blocs/auth_bloc/auth_bloc/auth_cubit.dart) | Dart | 1 | 0 | 1 | 2 |
| [lib/blocs/game_bloc/game_cubit.dart](/lib/blocs/game_bloc/game_cubit.dart) | Dart | 32 | 0 | 3 | 35 |
| [lib/blocs/game_bloc/game_states.dart](/lib/blocs/game_bloc/game_states.dart) | Dart | 1 | 0 | 1 | 2 |
| [lib/blocs/leaderboard_bloc/leaderboard_cubit.dart](/lib/blocs/leaderboard_bloc/leaderboard_cubit.dart) | Dart | 14 | -14 | 0 | 0 |
| [lib/blocs/user_bloc/user_cubit.dart](/lib/blocs/user_bloc/user_cubit.dart) | Dart | 43 | -27 | 2 | 18 |
| [lib/components/cashout_comp/cashout_card.dart](/lib/components/cashout_comp/cashout_card.dart) | Dart | -1 | 0 | 0 | -1 |
| [lib/components/game_comp/game_card.dart](/lib/components/game_comp/game_card.dart) | Dart | 35 | 0 | 3 | 38 |
| [lib/components/general/my_appbar.dart](/lib/components/general/my_appbar.dart) | Dart | 12 | 0 | 0 | 12 |
| [lib/components/profile_comp/app_info_box.dart](/lib/components/profile_comp/app_info_box.dart) | Dart | 200 | 5 | 8 | 213 |
| [lib/components/profile_comp/user_action_box.dart](/lib/components/profile_comp/user_action_box.dart) | Dart | 247 | 9 | 3 | 259 |
| [lib/components/profile_comp/user_details_box.dart](/lib/components/profile_comp/user_details_box.dart) | Dart | 91 | 6 | 5 | 102 |
| [lib/firebase_options.dart](/lib/firebase_options.dart) | Dart | 48 | 12 | 3 | 63 |
| [lib/main.dart](/lib/main.dart) | Dart | 8 | 0 | 0 | 8 |
| [lib/models/leaderboard_model.dart](/lib/models/leaderboard_model.dart) | Dart | 39 | 5 | 9 | 53 |
| [lib/models/tapwar_ranking_model.dart](/lib/models/tapwar_ranking_model.dart) | Dart | 32 | 5 | 6 | 43 |
| [lib/models/user_data_model.dart](/lib/models/user_data_model.dart) | Dart | 6 | 0 | 0 | 6 |
| [lib/screens/auth/login_page.dart](/lib/screens/auth/login_page.dart) | Dart | 4 | 0 | 1 | 5 |
| [lib/screens/auth/signup_page.dart](/lib/screens/auth/signup_page.dart) | Dart | 2 | 0 | 0 | 2 |
| [lib/screens/index.dart](/lib/screens/index.dart) | Dart | 12 | 0 | 3 | 15 |
| [lib/screens/main/cashout_page.dart](/lib/screens/main/cashout_page.dart) | Dart | 1 | 0 | 0 | 1 |
| [lib/screens/main/game_page.dart](/lib/screens/main/game_page.dart) | Dart | -35 | 0 | -1 | -36 |
| [lib/screens/main/games/scratch_game.dart](/lib/screens/main/games/scratch_game.dart) | Dart | 16 | 0 | 0 | 16 |
| [lib/screens/main/games/tap_game.dart](/lib/screens/main/games/tap_game.dart) | Dart | -2 | -1 | -7 | -10 |
| [lib/screens/main/games/wheel_game.dart](/lib/screens/main/games/wheel_game.dart) | Dart | 44 | 0 | 4 | 48 |
| [lib/screens/main/ranking_page.dart](/lib/screens/main/ranking_page.dart) | Dart | 198 | 0 | 2 | 200 |
| [lib/screens/profile_page.dart](/lib/screens/profile_page.dart) | Dart | 97 | 3 | 3 | 103 |
| [lib/screens/wallet_page.dart](/lib/screens/wallet_page.dart) | Dart | 300 | 7 | 7 | 314 |
| [lib/services/auth_api/auth_api.dart](/lib/services/auth_api/auth_api.dart) | Dart | 5 | 0 | 0 | 5 |
| [lib/services/firebase_api.dart](/lib/services/firebase_api.dart) | Dart | 53 | -45 | 2 | 10 |
| [lib/services/game_api/tap_war_api.dart](/lib/services/game_api/tap_war_api.dart) | Dart | 44 | 0 | 7 | 51 |
| [lib/services/game_api/wheel_api.dart](/lib/services/game_api/wheel_api.dart) | Dart | 43 | 0 | 8 | 51 |
| [lib/services/leaderboard_api/leaderboard_api.dart](/lib/services/leaderboard_api/leaderboard_api.dart) | Dart | 1 | 0 | 0 | 1 |
| [lib/services/user_api/user_api.dart](/lib/services/user_api/user_api.dart) | Dart | 21 | 0 | 2 | 23 |
| [lib/src/app_root.dart](/lib/src/app_root.dart) | Dart | 16 | -7 | 0 | 9 |
| [macos/Flutter/GeneratedPluginRegistrant.swift](/macos/Flutter/GeneratedPluginRegistrant.swift) | Swift | 10 | 0 | 0 | 10 |
| [pubspec.yaml](/pubspec.yaml) | YAML | 7 | 0 | 0 | 7 |
| [windows/flutter/generated_plugin_registrant.cc](/windows/flutter/generated_plugin_registrant.cc) | C++ | 3 | 0 | 0 | 3 |

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details