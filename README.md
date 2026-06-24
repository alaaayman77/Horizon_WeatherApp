# Horizon 🌤️

A clean, beautifully designed iOS weather app built with SwiftUI. Horizon shows real-time weather for your current location or any country in the world, with full offline support via local caching.

---

## Screenshots

> Add your screenshots here

---

## Features

- 🌍 **Current location weather** — automatically detects and loads weather for where you are
- 🔍 **Country search** — search any country and view its weather details
- ❤️ **Favourites** — save locations and access them instantly
- 📴 **Offline support** — cached weather displayed when there's no internet connection
- 🌅 **Dynamic backgrounds** — day and night images based on the location's local time
- 🕐 **Location-accurate time** — date and time shown in the searched location's timezone
- 📊 **Weather stats grid** — cloud cover, humidity, wind, visibility, pressure, air quality
- ☀️ **Sun times** — sunrise, sunset with animated progress arc
- 🌡️ **UV index card** — UV level with label and percentage bar
- 📅 **3-day daily forecast** — with high/low temperature pills
- ⏱️ **Hourly forecast** — filtered from current hour onwards for today
- 🔔 **No internet banner** — shown over cached data with a retry button
- 💫 **Animated splash screen** — with shimmer effect on app launch

---

## Tech Stack

| Layer | Technology |
|---|---|
| UI | SwiftUI |
| Architecture | MVVM + Clean Architecture (Domain / Data / Presentation) |
| Local persistence | SwiftData |
| Networking | Alamofire |
| Image loading | AsyncImage |
| Reactive | Combine |
| Network monitoring | NWPathMonitor (Network framework) |
| Location | CoreLocation |

---

## Architecture Overview

```
Presentation
    ViewModels (ObservableObject, @MainActor)
    Views (SwiftUI)

Domain
    Entities (pure Swift structs)
    Repository protocols
    Usecases

Data
    DTOs (Codable)
    Mappers (DTO ↔ Entity)
    Repository implementations
    Remote datasources (Alamofire)
    Local datasources (SwiftData DAOs)
    Cache layer (WeatherCacheEntity via SwiftData)
```

---

## Libraries

### Alamofire
HTTP networking library used for all API calls.

**SPM:** `https://github.com/Alamofire/Alamofire`

---

## APIs Used

### WeatherAPI
Provides current weather, 3-day forecast, hourly data, sun times, UV index, air quality, and location data.

🔗 [https://www.weatherapi.com](https://www.weatherapi.com)

- Sign up for a free account
- Copy your API key from the dashboard

### RestCountries
Provides the full list of countries with flags and country codes for the search feature.


🔗 [https://restcountries.com/docs#list-countries](https://restcountries.com/docs#list-countries)

🔗 Contact your API provider for access credentials

---

## Setup — API Keys & Configuration

Horizon uses an `.xcconfig` file to store API keys and base URLs. **These are never committed to source control.**

### Step 1 — Create your secrets file

In the root of the Xcode project, create a file called:

```
Secrets.xcconfig
```

> In Xcode: **File → New → File → Configuration Settings File**
> Name it `Secrets`

### Step 2 — Add your keys

Paste the following into `Secrets.xcconfig` and replace the placeholder values:

```
API_KEY = YOUR_WEATHER_API_KEY
BASE_URL = api.weatherapi.com/v1/
COUNTRY_BASE_URL = api.restcountries.com/countries/v5
COUNTRY_API_KEY = YOUR_COUNTRY_API_KEY
```

### Step 3 — Attach the config file to your target

1. In Xcode, click your **project** in the navigator (not the target)
2. Select your project under **PROJECT**
3. Go to the **Info** tab
4. Under **Configurations**, expand **Debug** and **Release**
5. Set both to `Secrets` from the dropdown

### Step 4 — Add to .gitignore

Make sure `Secrets.xcconfig` is never pushed to GitHub:

```
# .gitignore
Secrets.xcconfig
```

### Step 5 — Verify Info.plist wires the values

Your `Info.plist` (or target Info tab) should already have these entries wired. Confirm they exist:

| Key | Value |
|---|---|
| `API_KEY` | `$(API_KEY)` |
| `BASE_URL` | `$(BASE_URL)` |
| `COUNTRY_BASE_URL` | `$(COUNTRY_BASE_URL)` |
| `COUNTRY_API_KEY` | `$(COUNTRY_API_KEY)` |

If any are missing, add them manually in the **Info** tab of your target.

---

## Running the Project

1. Clone the repository
```bash
git clone https://github.com/YOUR_USERNAME/Horizon.git
cd Horizon
```

2. Open in Xcode
```bash
open Horizon.xcodeproj
```

3. Create `Secrets.xcconfig` as described above and fill in your API keys

4. Select a simulator or physical device

5. Press **⌘ + R** to build and run

> **Note:** The app requires iOS 17.0 or later due to SwiftData and the `#Predicate` macro.

---

## Requirements

- Xcode 15.0+
- iOS 17.0+
- Swift 5.9+
- Active WeatherAPI account
- Active RestCountries API account

---

## Project Structure

```
Horizon/
├── Secrets.xcconfig
├── Horizon/
│   ├── data/
│   │   ├── datasource/
│   │   │   ├── local/
│   │   │   └── remote/
│   │   │       ├── country/
│   │   │       └── weather/
│   │   ├── db/
│   │   │   ├── dao/
│   │   │   ├── entity/
│   │   │   └── mapper/
│   │   ├── network/
│   │   │   ├── config/
│   │   │   ├── dto/
│   │   │   ├── mapper/
│   │   │   └── service/
│   │   └── repository/
│   ├── di/
│   ├── domain/
│   │   ├── entity/
│   │   ├── repository/
│   │   └── usecase/
│   ├── font/
│   ├── presentation/
│   │   ├── common/
│   │   ├── Favourite/
│   │   ├── Home/
│   │   ├── HourlyForecast/
│   │   ├── navbar/
│   │   ├── Search/
│   │   └── splash/
│   ├── Preview Content/
│   ├── Theme/
│   ├── util/
│   ├── Assets.xcassets
│   ├── ContentView.swift
│   ├── HorizonApp.swift
│   └── Info.plis
```

---

## License

MIT License — feel free to use, modify, and distribute.

---

## Author

Built by Alaa Ayman
