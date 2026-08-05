import "./VehicleInfoGrid.css";

export default function VehicleInfoGrid({
  left,
  right,
}) {
  return (
    <section className="vehicle-info-grid">
      <div className="info-column">
        {left}
      </div>

      <div className="info-column">
        {right}
      </div>
    </section>
  );
}
