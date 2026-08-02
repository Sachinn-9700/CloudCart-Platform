import porscheGT3RS from "../../assets/images/hero/porsche-gt3rs.png";
import ferrariF8 from "../../assets/cars/ferrari-f8-tributo.webp";
import huracanSTO from "../../assets/cars/lamborghini-huracan-sto.webp";
import mclaren720S from "../../assets/cars/mclaren-720s.webp";
import bmwM4CSL from "../../assets/cars/bmw-m4-csl.webp";

const cars = [
  {
    id: 1,
    slug: "porsche-911-gt3-rs",

    type: "car",

    brand: "Porsche",
    model: "911",
    variant: "GT3 RS",

    year: 2023,

    mileage: 4800,

    importedFrom: "UAE",

    transmission: "PDK Automatic",

    fuelType: "Petrol",

    engine: "4.0L Naturally Aspirated Flat-6",

    horsepower: 518,

    drivetrain: "RWD",

    exteriorColor: "Arctic Grey",

    interiorColor: "Black Alcantara",

    owners: 1,

    originalPrice: 38000000,

    currentPrice: 17800000,

    savings: 20200000,

    certified: true,

    featured: true,

    arrival: "New Arrival",

    collectorEdition: false,

    image: porscheGT3RS
  },

  {
    id: 2,

    slug: "ferrari-f8-tributo",

    type: "car",

    brand: "Ferrari",

    model: "F8",

    variant: "Tributo",

    year: 2022,

    mileage: 5200,

    importedFrom: "Dubai",

    transmission: "7-Speed DCT",

    fuelType: "Petrol",

    engine: "3.9L Twin Turbo V8",

    horsepower: 710,

    drivetrain: "RWD",

    exteriorColor: "Rosso Corsa",

    interiorColor: "Black",

    owners: 1,

    originalPrice: 48000000,

    currentPrice: 19800000,

    savings: 28200000,

    certified: true,

    featured: true,

    arrival: "CloudCart Certified",

    collectorEdition: false,

    image: ferrariF8
  },

  {
    id: 3,

    slug: "lamborghini-huracan-sto",

    type: "car",

    brand: "Lamborghini",

    model: "Huracán",

    variant: "STO",

    year: 2022,

    mileage: 3400,

    importedFrom: "UAE",

    transmission: "7-Speed DCT",

    fuelType: "Petrol",

    engine: "5.2L V10",

    horsepower: 631,

    drivetrain: "RWD",

    exteriorColor: "Verde Mantis",

    interiorColor: "Black",

    owners: 1,

    originalPrice: 51000000,

    currentPrice: 21500000,

    savings: 29500000,

    certified: true,

    featured: true,

    arrival: "Collector Edition",

    collectorEdition: true,

    image: huracanSTO
  },

  {
    id: 4,

    slug: "mclaren-720s",

    type: "car",

    brand: "McLaren",

    model: "720S",

    variant: "Performance",

    year: 2022,

    mileage: 3900,

    importedFrom: "United Kingdom",

    transmission: "7-Speed SSG",

    fuelType: "Petrol",

    engine: "4.0L Twin Turbo V8",

    horsepower: 710,

    drivetrain: "RWD",

    exteriorColor: "Orange",

    interiorColor: "Black",

    owners: 1,

    originalPrice: 42000000,

    currentPrice: 18600000,

    savings: 23400000,

    certified: true,

    featured: true,

    arrival: "New Arrival",

    collectorEdition: false,

    image: mclaren720S
  },

  {
    id: 5,

    slug: "bmw-m4-csl",

    type: "car",

    brand: "BMW",

    model: "M4",

    variant: "CSL",

    year: 2023,

    mileage: 6200,

    importedFrom: "Germany",

    transmission: "8-Speed Automatic",

    fuelType: "Petrol",

    engine: "3.0L Twin Turbo Inline-6",

    horsepower: 543,

    drivetrain: "RWD",

    exteriorColor: "Frozen Black",

    interiorColor: "Black & Red",

    owners: 1,

    originalPrice: 18000000,

    currentPrice: 9200000,

    savings: 8800000,

    certified: true,

    featured: true,

    arrival: "CloudCart Certified",

    collectorEdition: false,

    image: bmwM4CSL
  }
];

export default cars;