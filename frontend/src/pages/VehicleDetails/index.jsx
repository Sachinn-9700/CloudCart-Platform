import { useParams } from "react-router-dom";

export default function VehicleDetails() {
  const { slug } = useParams();

  return (
    <main
      style={{
        maxWidth: "1200px",
        margin: "80px auto",
        padding: "2rem",
        color: "#fff",
      }}
    >
      <h1>Vehicle Details</h1>

      <p>
        Vehicle Slug:
      </p>

      <h2>{slug}</h2>

      <p style={{ marginTop: "2rem", opacity: 0.7 }}>
        Sprint 3.2 will replace this placeholder with the complete premium
        vehicle details page.
      </p>
    </main>
  );
}
