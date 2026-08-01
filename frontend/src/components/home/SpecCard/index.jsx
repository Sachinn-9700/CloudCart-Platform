import "./SpecCard.css";

export default function SpecCard() {
  return (
    <div className="spec-card">

      <span className="spec-label">
        Collector Edition
      </span>

      <h3>
        Porsche 911 GT3 RS
      </h3>

      <div className="spec-grid">

        <div>
          <small>Year</small>
          <strong>2023</strong>
        </div>

        <div>
          <small>Mileage</small>
          <strong>6,200 km</strong>
        </div>

        <div>
          <small>Power</small>
          <strong>525 HP</strong>
        </div>

        <div>
          <small>CloudCart Price</small>
          <strong>₹3.65 Cr</strong>
        </div>

      </div>

    </div>
  );
}