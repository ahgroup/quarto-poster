# Create the example SVG figure used by the Quarto poster template.
#
# This script intentionally uses base R only so the template does not require
# extra packages just to regenerate the example asset. Run from the repository
# root with: Rscript code/make-example-figure.r

output_file <- file.path("figures", "example-results.svg")

if (!dir.exists("figures")) {
  stop("The figures/ folder does not exist. Run this script from the repository root.")
}

set.seed(20260618)

x <- seq(0, 10, length.out = 60)
y <- 0.5 + 0.28 * x + sin(x * 0.9) * 0.35 + rnorm(length(x), sd = 0.18)
group <- ifelse(x < 5, "Scenario A", "Scenario B")

svg(filename = output_file, width = 8.5, height = 5.2, bg = "transparent")
par(
  mar = c(4.7, 5.0, 1.2, 0.7),
  family = "sans",
  las = 1,
  bty = "n"
)
plot(
  x,
  y,
  type = "n",
  xlab = "Predictor or time",
  ylab = "Outcome measure",
  cex.lab = 1.35,
  cex.axis = 1.1
)
grid(col = "#d9d9d9", lwd = 1)
points(x[group == "Scenario A"], y[group == "Scenario A"], pch = 16, cex = 1.6, col = "#003057")
points(x[group == "Scenario B"], y[group == "Scenario B"], pch = 16, cex = 1.6, col = "#BA0C2F")
model <- loess(y ~ x, span = 0.6)
lines(x, predict(model), lwd = 4, col = "#1f1f1f")
legend(
  "topleft",
  legend = c("Scenario A", "Scenario B", "Smoothed trend"),
  pch = c(16, 16, NA),
  lty = c(NA, NA, 1),
  lwd = c(NA, NA, 4),
  col = c("#003057", "#BA0C2F", "#1f1f1f"),
  bty = "n",
  cex = 1.15
)
dev.off()

message("Wrote ", output_file)
