import { Link } from "react-router-dom";
import "./InventoryCard.css";

function formatPrice(price) {
  return new Intl.NumberFormat("en-IN", {
    style: "currency",
    currency: "INR",
    maximumFractionDigits: 0,
  }).format(price);
}

export default function InventoryCard({ vehicle }) {
  const detailsPath =
    vehicle.type === "bike"
      ? `/bikes/${vehicle.slug}`
      : `/cars/${vehicle.slug}`;

  return (
    <article className="vehicle-card">
      <div className="vehicle-image">
        <img
          src={vehicle.image}
          alt={`${vehicle.brand} ${vehicle.model}`}
        />

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

      <div className="vehicle-info">
        <span className="brand">
          {vehicle.brand}
        </span>

        <h3>
          {vehicle.model} {vehicle.variant}
        </h3>

        <div className="meta">
          <span>{vehicle.year}</span>

          <span>
            {vehicle.mileage.toLocaleString()} km
          </span>

          <span>{vehicle.importedFrom}</span>
        </div>

        <div className="price">
          <small>Market Price</small>

          <del>{formatPrice(vehicle.originalPrice)}</del>

          <h2>{formatPrice(vehicle.currentPrice)}</h2>
        </div>

        <Link
          to={detailsPath}
          className="details-button"
        >
          View Details →
        </Link>
      </div>
    </article>
  );
}