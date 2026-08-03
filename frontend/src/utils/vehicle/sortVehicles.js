export default function sortVehicles(
  vehicles,
  sortBy = "newest"
) {
  const sorted = [...vehicles];

  switch (sortBy) {
    case "price-low":
      return sorted.sort(
        (a, b) => a.currentPrice - b.currentPrice
      );

    case "price-high":
      return sorted.sort(
        (a, b) => b.currentPrice - a.currentPrice
      );

    case "mileage":
      return sorted.sort(
        (a, b) => a.mileage - b.mileage
      );

    case "horsepower":
      return sorted.sort(
        (a, b) => b.horsepower - a.horsepower
      );

    case "newest":
    default:
      return sorted.sort(
        (a, b) => b.year - a.year
      );
  }
}