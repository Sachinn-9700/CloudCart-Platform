import "./VehicleOverview.css";

export default function VehicleOverview({ vehicle }) {
  return (
    <section className="vehicle-overview">

      <h2>Why You'll Love This Machine</h2>

      <p>
        This {vehicle.year} {vehicle.brand} {vehicle.model} {vehicle.variant}
        has been carefully sourced and inspected by CloudCart.
      </p>

      <p>
        Imported from {vehicle.importedFrom}, driven only{" "}
        {vehicle.mileage.toLocaleString()} km, and maintained to premium
        standards, this vehicle is ready for its next owner.
      </p>

      <div className="overview-highlights">

        <div>✓ CloudCart Certified</div>

        <div>✓ Ownership Verified</div>

        <div>✓ Inspection Completed</div>

        <div>✓ Premium Condition</div>

      </div>

    </section>
  );
}