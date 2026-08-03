import "./InventoryGrid.css";

import InventoryCard from "../InventoryCard/InventoryCard";

export default function InventoryGrid({ vehicles }) {
  if (!vehicles.length) {
    return (
      <section className="inventory-empty">
        <h2>No vehicles found.</h2>
        <p>Try changing your search or filters.</p>
      </section>
    );
  }

  return (
    <section className="inventory-grid">
      {vehicles.map((vehicle) => (
        <InventoryCard
          key={vehicle.id}
          vehicle={vehicle}
        />
      ))}
    </section>
  );
}