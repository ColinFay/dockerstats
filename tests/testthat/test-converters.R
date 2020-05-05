test_that("converter works", {
  # Bit
  expect_equal(as.numeric(to_b("1b")), 1)
  expect_equal(as.numeric(to_kib("1b")), 0.0009765625)
  expect_equal(as.numeric(to_mib("1b")), 9.532888e-07)
  #expect_is(as.numeric(to_gib("1mb")))
  #Kib
  expect_equal(as.numeric(to_b("1kib")), 1024)
  expect_equal(as.numeric(to_kib("1kib")), 1)
  expect_equal(as.numeric(to_mib("1kib")), 0.0009765625)
  expect_equal(as.numeric(to_gib("1kib")), 9.532888e-07)
  #Mib
  expect_equal(as.numeric(to_b("1mib")), 1049000)
  expect_equal(as.numeric(to_kib("1mib")), 1024)
  expect_equal(as.numeric(to_mib("1mib")), 1)
  expect_equal(as.numeric(to_gib("1mib")), 0.0009765625)
  #Gib
  expect_equal(as.numeric(to_b("1gib")), 1.074e+09)
  expect_equal(as.numeric(to_kib("1gib")), 1049000)
  expect_equal(as.numeric(to_mib("1gib")), 1024)
  expect_equal(as.numeric(to_gib("1gib")), 1)
})
