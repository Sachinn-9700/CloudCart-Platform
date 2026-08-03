import { useMemo, useState } from "react";

import filterVehicles from "../utils/vehicle/filterVehicles";
import sortVehicles from "../utils/vehicle/sortVehicles";

export default function useInventory(initialVehicles = []) {
  const [search, setSearch] = useState("");
  const [brand, setBrand] = useState("All");
  const [sortBy, setSortBy] = useState("newest");

  const filteredVehicles = useMemo(() => {
    const filtered = filterVehicles(initialVehicles, {
      search,
      brand,
    });

    return sortVehicles(filtered, sortBy);
  }, [initialVehicles, search, brand, sortBy]);

  return {
    filteredVehicles,

    search,
    setSearch,

    brand,
    setBrand,

    sortBy,
    setSortBy,
  };
}