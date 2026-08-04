import "./VehiclePricing.css";

function formatPrice(price) {
  return new Intl.NumberFormat("en-IN", {
    style: "currency",
    currency: "INR",
    maximumFractionDigits: 0,
  }).format(price);
}

export default function VehiclePricing({ vehicle }) {

  return (

    <section className="vehicle-pricing">

      <small>
        CloudCart Price
      </small>

      <h2>
        {formatPrice(vehicle.currentPrice)}
      </h2>

      <p className="market-price">

        Market Price

        <span>
          {formatPrice(vehicle.originalPrice)}
        </span>

      </p>

      <div className="price-saving">

        You Save

        <strong>
          {formatPrice(vehicle.savings)}
        </strong>

      </div>

      <div className="pricing-highlight">

        Low driven • Verified ownership • Premium inspection completed

      </div>

    </section>

  );

}

