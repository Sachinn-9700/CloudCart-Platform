import ducatiPanigale from "../../assets/bikes/ducati-panigale-v4r.webp";
import bmwS1000RR from "../../assets/bikes/bmw-s1000rr.webp";
import kawasakiH2 from "../../assets/bikes/kawasaki-h2.webp";
import triumph765RS from "../../assets/bikes/triumph-street-triple-765-rs.webp";

const bikes = [
  {
    id: 101,

    slug: "ducati-panigale-v4r",

    type: "bike",

    brand: "Ducati",

    model: "Panigale",

    variant: "V4 R",

    year: 2023,

    mileage: 2100,

    importedFrom: "Italy",

    transmission: "6-Speed",

    fuelType: "Petrol",

    engine: "998cc Desmosedici Stradale R",

    horsepower: 237,

    drivetrain: "Chain",

    exteriorColor: "Ducati Red",

    owners: 1,

    originalPrice: 7200000,

    currentPrice: 3850000,

    savings: 3350000,

    certified: true,

    featured: true,

    arrival: "CloudCart Certified",

    collectorEdition: true,

    image: ducatiPanigale
  },

  {
    id: 102,

    slug: "bmw-s1000rr",

    type: "bike",

    brand: "BMW",

    model: "S1000RR",

    variant: "M Package",

    year: 2023,

    mileage: 3600,

    importedFrom: "Germany",

    transmission: "6-Speed",

    fuelType: "Petrol",

    engine: "999cc Inline-4",

    horsepower: 205,

    drivetrain: "Chain",

    exteriorColor: "Light White M",

    owners: 1,

    originalPrice: 4200000,

    currentPrice: 2480000,

    savings: 1720000,

    certified: true,

    featured: true,

    arrival: "New Arrival",

    collectorEdition: false,

    image: bmwS1000RR
  },

  {
    id: 103,

    slug: "kawasaki-h2",

    type: "bike",

    brand: "Kawasaki",

    model: "Ninja H2",

    variant: "Carbon",

    year: 2022,

    mileage: 4300,

    importedFrom: "Japan",

    transmission: "6-Speed",

    fuelType: "Petrol",

    engine: "998cc Supercharged",

    horsepower: 228,

    drivetrain: "Chain",

    exteriorColor: "Mirror Coated Black",

    owners: 1,

    originalPrice: 5200000,

    currentPrice: 2950000,

    savings: 2250000,

    certified: true,

    featured: true,

    arrival: "Collector Edition",

    collectorEdition: true,

    image: kawasakiH2
  },

  {
    id: 104,

    slug: "triumph-street-triple-765-rs",

    type: "bike",

    brand: "Triumph",

    model: "Street Triple",

    variant: "765 RS",

    year: 2024,

    mileage: 1800,

    importedFrom: "United Kingdom",

    transmission: "6-Speed",

    fuelType: "Petrol",

    engine: "765cc Inline-3",

    horsepower: 128,

    drivetrain: "Chain",

    exteriorColor: "Carnival Red",

    owners: 1,

    originalPrice: 2200000,

    currentPrice: 1480000,

    savings: 720000,

    certified: true,

    featured: false,

    arrival: "New Arrival",

    collectorEdition: false,

    image: triumph765RS
  }
];

export default bikes;