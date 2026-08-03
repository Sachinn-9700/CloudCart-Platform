import "./FeaturedCollection.css";

import InventoryCard from "../../inventory/InventoryCard/InventoryCard";
import getFeaturedVehicles from "../../../utils/inventory/getFeaturedVehicles";

export default function FeaturedCollection() {

  const vehicles = getFeaturedVehicles();

  return (

    <section className="featured-section">

      <div className="section-heading">

        <p>Featured Collection</p>

        <h2>
          Curated Luxury Inventory
        </h2>

      </div>

      <div className="vehicle-grid">

        {vehicles.map((vehicle) => (

          <InventoryCard
            key={vehicle.id}
            vehicle={vehicle}
          />

        ))}

      </div>

    </section>

  );

}