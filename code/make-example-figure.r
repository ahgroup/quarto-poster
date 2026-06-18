# Create the example SVG figures used by the Quarto poster template.
#
# This script intentionally uses base R only so the template does not require
# extra packages just to regenerate the example assets. Run from the repository
# root with: Rscript code/make-example-figure.r

if (!dir.exists("figures")) {
  stop("The figures/ folder does not exist. Run this script from the repository root.")
}

set.seed(20260618)

# -----------------------------------------------------------------------------
# Example descriptive/result figure
# -----------------------------------------------------------------------------
output_file <- file.path("figures", "example-results.svg")

x <- seq(0, 10, length.out = 90)
group <- rep(c("Group A", "Group B", "Group C"), each = 30)
y <- c(
  0.5 + 0.22 * x[1:30] + rnorm(30, sd = 0.20),
  0.8 + 0.33 * x[31:60] + rnorm(30, sd = 0.22),
  0.3 + 0.16 * x[61:90] + rnorm(30, sd = 0.18)
)
cols <- c("Group A" = "#E69F00", "Group B" = "#56B4E9", "Group C" = "#999999")

svg(filename = output_file, width = 8.5, height = 5.2, bg = "transparent")
par(mar = c(4.7, 5.0, 1.2, 0.7), family = "sans", las = 1, bty = "n")
plot(
  x, y,
  type = "n",
  xlab = "Predictor or time",
  ylab = "Outcome measure",
  cex.lab = 1.35,
  cex.axis = 1.1
)
grid(col = "#d9d9d9", lwd = 1)
for (this_group in names(cols)) {
  idx <- group == this_group
  points(x[idx], y[idx], pch = 16, cex = 1.5, col = adjustcolor(cols[this_group], 0.75))
  fit <- loess(y[idx] ~ x[idx], span = 0.9)
  lines(x[idx], predict(fit), lwd = 4, col = cols[this_group])
}
legend(
  "topleft",
  legend = names(cols),
  pch = 16,
  col = cols,
  bty = "n",
  cex = 1.15
)
dev.off()
message("Wrote ", output_file)

# -----------------------------------------------------------------------------
# Example model-estimate/coefficient figure
# -----------------------------------------------------------------------------
output_file <- file.path("figures", "example-model-estimates.svg")
terms <- c("Group B vs A", "Group C vs A", "Baseline value", "Age group", "Sensitivity check")
est <- c(0.65, -0.20, 0.45, -0.10, 0.30)
lo <- c(0.20, -0.65, 0.12, -0.42, -0.05)
hi <- c(1.10, 0.25, 0.78, 0.22, 0.65)

svg(filename = output_file, width = 8.5, height = 4.8, bg = "transparent")
par(mar = c(4.8, 7.8, 1.0, 0.8), family = "sans", las = 1, bty = "n")
ny <- length(terms)
plot(
  NA,
  xlim = c(-0.9, 1.25),
  ylim = c(0.5, ny + 0.5),
  yaxt = "n",
  xlab = "Adjusted difference (95% interval)",
  ylab = "",
  cex.lab = 1.25,
  cex.axis = 1.05
)
abline(v = 0, lty = 2, lwd = 2, col = "#333333")
grid(nx = NA, ny = NULL, col = "#e6e6e6")
ypos <- seq_len(ny)
segments(lo, ypos, hi, ypos, lwd = 4, col = "#333333")
points(est, ypos, pch = 16, cex = 2.0, col = "#BA0C2F")
axis(2, at = ypos, labels = terms, tick = FALSE, cex.axis = 1.05)
dev.off()
message("Wrote ", output_file)
