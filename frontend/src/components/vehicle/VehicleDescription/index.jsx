import "./VehicleDescription.css";

export default function VehicleDescription({ vehicle }) {

  return (

    <section className="vehicle-description">

      <h2>
        Why You'll Love This Machine
      </h2>

      <p>

        This {vehicle.year} {vehicle.brand} {vehicle.model} {vehicle.variant}
        is finished in {vehicle.exteriorColor} and powered by a
        {" "}
        {vehicle.engine}
        {" "}
        producing
        {" "}
        {vehicle.horsepower}
        {" "}
        horsepower.

      </p>

      <p>

        It has covered only
        {" "}
        <strong>
          {vehicle.mileage.toLocaleString()} km
        </strong>
        , making it a genuinely low-driven example.

      </p>

      <blockquote>

        "Built in {vehicle.importedFrom}.
        Admired everywhere.
        Waiting for one final address."

      </blockquote>

      <blockquote>

        "Some people collect watches.
        Others collect moments.
        This creates both."

      </blockquote>

      <blockquote>

        "Tomorrow's memories usually begin with one brave decision."

      </blockquote>

    </section>

  );

}
