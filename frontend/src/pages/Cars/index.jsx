import { useMemo } from "react";

import InventoryHeader from "../../components/inventory/InventoryHeader";
import InventoryToolbar from "../../components/inventory/InventoryToolbar";
import InventorySidebar from "../../components/inventory/InventorySidebar";
import InventoryGrid from "../../components/inventory/InventoryGrid";

import useInventory from "../../hooks/useInventory";

import getAllCars from "../../utils/vehicle/getAllCars";

export default function Cars() {
  const vehicles = getAllCars();

  const {
    search,
    setSearch,
    sortBy,
    setSortBy,
    brand,
    setBrand,
    filteredVehicles,
  } = useInventory(vehicles);

  const brands = useMemo(() => {
    return [...new Set(vehicles.map((vehicle) => vehicle.brand))];
  }, [vehicles]);

  return (
    <main className="container">

      <InventoryHeader
        title="Luxury Cars"
        subtitle="Explore premium imported performance cars."
      />

      <InventoryToolbar
        total={filteredVehicles.length}
        search={search}
        setSearch={setSearch}
        sortBy={sortBy}
        setSortBy={setSortBy}
      />

      <div
        style={{
          display: "grid",
          gridTemplateColumns: "260px 1fr",
          gap: "2rem",
          alignItems: "start",
        }}
      >
        <InventorySidebar
          brands={brands}
          brand={brand}
          setBrand={setBrand}
        />

        <InventoryGrid
          vehicles={filteredVehicles}
        />

      </div>

    </main>
  );
}