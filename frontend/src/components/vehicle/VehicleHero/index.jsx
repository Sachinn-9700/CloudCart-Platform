import "./VehicleHero.css";

export default function VehicleHero({ vehicle }) {
  return (
    <section className="vehicle-hero">
      <div className="vehicle-hero-image">
        <img
          src={vehicle.image}
          alt={`${vehicle.brand} ${vehicle.model}`}
        />
      </div>

      <div className="vehicle-hero-content">

        <span className="vehicle-brand">
          {vehicle.brand}
        </span>

        <h1>
          {vehicle.model} {vehicle.variant}
        </h1>

        <p className="hero-tagline">
          Engineered to dominate.
          <br />
          Rare enough to stop traffic.
        </p>

        <div className="vehicle-badges">

          {vehicle.certified && (
            <span className="badge certified">
              CloudCart Certified
            </span>
          )}

          {vehicle.collectorEdition && (
            <span className="badge collector">
              Collector Edition
            </span>
          )}

        </div>

        <div className="vehicle-meta">

          <span>{vehicle.year}</span>

          <span>
            Driven only {vehicle.mileage.toLocaleString()} km
          </span>

          <span>
            Imported from {vehicle.importedFrom}
          </span>

        </div>

      </div>

    </section>
  );
}
