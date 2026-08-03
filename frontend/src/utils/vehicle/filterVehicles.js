export default function filterVehicles(
  vehicles,
  {
    search = "",
    brand = "All",
  } = {}
) {
  let filtered = [...vehicles];

  if (brand !== "All") {
    filtered = filtered.filter(
      (vehicle) => vehicle.brand === brand
    );
  }

  if (search.trim()) {
    const query = search.toLowerCase();

    filtered = filtered.filter((vehicle) =>
      [
        vehicle.brand,
        vehicle.model,
        vehicle.variant,
      ]
        .join(" ")
        .toLowerCase()
        .includes(query)
    );
  }

  return filtered;
}