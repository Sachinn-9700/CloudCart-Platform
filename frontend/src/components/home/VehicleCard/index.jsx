import "./VehicleCard.css";

export default function VehicleCard({ vehicle }) {
  return (
    <article className="vehicle-card">

      <img
        src={vehicle.image}
        alt={vehicle.model}
      />

      <div className="vehicle-info">

        <span className="brand">
          {vehicle.brand}
        </span>

        <h3>
          {vehicle.model}
        </h3>

        <div className="meta">

          <span>{vehicle.year}</span>

          <span>{vehicle.mileage.toLocaleString()} KM</span>

          <span>{vehicle.importedFrom}</span>

        </div>

        <div className="price">

          <small>
            Market Price
          </small>

          <del>
            {vehicle.marketPrice}
          </del>

          <h2>
            {vehicle.cloudCartPrice}
          </h2>

        </div>

        <button>

          Explore Vehicle →

        </button>

      </div>

    </article>
  );
}