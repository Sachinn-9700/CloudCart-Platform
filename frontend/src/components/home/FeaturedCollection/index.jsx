import "./FeaturedCollection.css";

import featuredVehicles from "../../../data/featuredVehicles";

import VehicleCard from "../VehicleCard";

export default function FeaturedCollection() {

  return (

    <section className="featured-section">

      <div className="section-heading">

        <p>Featured Collection</p>

        <h2>

          Curated Luxury Inventory

        </h2>

      </div>

      <div className="vehicle-grid">

        {featuredVehicles.map(vehicle => (

          <VehicleCard

            key={vehicle.id}

            vehicle={vehicle}

          />

        ))}

      </div>

    </section>

  );

}