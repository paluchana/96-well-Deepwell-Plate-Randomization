# install.packages("ggplate")
library(ggplate)

myLetters <- function(length.out) {
  a <- rep(LETTERS, length.out = length.out)
  grp <- cumsum(a == "A")
  vapply(seq_along(a), 
         function(x) paste(rep(a[x], grp[x]), collapse = ""),
         character(1L))
}

# seed for randomization
# i.e. in order of plate 1 (outer, mid and inner zone) and plate 2 (outer, mid and inner zone)
# here you can define seeds for the different zones for the different experiments and have an overview of the used set seeds
# not advised to use the same seed for a particular zone more than once -> will result in same randomization
random_seed_sfxx <- c(1,2,3,4,5,6)
random_seed_sfyy <- c(7,8,9,10,11,12)

seed_set <- random_seed_sfxx # define which seed set to use for this iteration of randomization

# plate position in temperature zones
temp_zones <- list()
temp_zones[['plate1']]$zone_B1 <- c('A1', 'A2', 'A3', 'A4', 'A9', 'A10', 'A11', 'A12',
                                  'B1', 'B12', 'C1', 'C12', 'D1', 'D12', 'E1', 'E12', 
                                  'F1', 'F12', 'G1', 'G12', 'H1', 'H2', 'H3', 'H4',
                                  'H5', 'H6', 'H7', 'H8', 'H9', 'H10', 'H11', 'H12')

temp_zones[['plate1']]$zone_B2 <- c('A5', 'A6', 'A7', 'A8', 'B2', 'B3', 'B4', 'B5', 
                                    'B6', 'B7', 'B8', 'B9', 'B10', 'B11', 'C2', 'C11', 
                                    'D2', 'D11', 'E2', 'E11', 'F2', 'F11', 'G2', 'G3', 
                                    'G4', 'G5', 'G6', 'G7', 'G8', 'G9', 'G10', 'G11')

temp_zones[['plate1']]$zone_B3 <- c('C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'C9', 'C10',
                                    'D3', 'D4', 'D5', 'D6', 'D7', 'D8', 'D9', 'D10', 
                                    'E3', 'E4', 'E5', 'E6', 'E7', 'E8', 'E9', 'E10',
                                    'F3', 'F4', 'F5', 'F6', 'F7', 'F8', 'F9', 'F10')


temp_zones[['plate2']]$zone_B1 <- c('A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8', 'A9', 'A10', 'A11', 
                                    'A12', 'B1', 'B12', 'C1', 'C12', 'D1', 'D12', 'E1', 'E12', 'F1', 
                                    'F12', 'G1', 'G12', 'H1', 'H2', 'H3', 'H4', 'H9', 'H10', 'H11', 'H12')

temp_zones[['plate2']]$zone_B2 <- c('B2', 'B3', 'B4', 'B5', 'B6', 'B7', 'B8', 'B9', 'B10', 'B11', 'C2', 
                                    'C11', 'D2', 'D11', 'E2', 'E11', 'F2', 'F11', 'G2', 'G3', 'G4', 'G5',
                                    'G6', 'G7', 'G8', 'G9', 'G10', 'G11', 'H5', 'H6', 'H7', 'H8')

temp_zones[['plate2']]$zone_B3 <- c('C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'C9', 'C10',
                                    'D3', 'D4', 'D5', 'D6', 'D7', 'D8', 'D9', 'D10', 
                                    'E3', 'E4', 'E5', 'E6', 'E7', 'E8', 'E9', 'E10',
                                    'F3', 'F4', 'F5', 'F6', 'F7', 'F8', 'F9', 'F10')

sampleList <- list()

# sample list for plate 1
sampleId_pt1 <- sprintf('%0.3d', 1:96)
exp_condition_pt1 <- as.factor(rep(myLetters(32)[1:32], each=3))
replicate_pt1 <- as.factor(as.vector(rep(1:3, 32)))
merged_pt1 <- paste0(rep(myLetters(32)[1:32], each=3),as.vector(rep(1:3, 32)))
sampleList[['plate1']] <- data.frame(sampleId_pt1, exp_condition_pt1, replicate_pt1, merged_pt1)
colnames(sampleList[['plate1']]) <- c('sampleId', 'exp_condition', 'replicate', 'merged')


# sample list for plate 2
sampleId_pt2 <- sprintf('%0.3d', 1:96)
exp_condition_pt2 <- as.factor(rep(myLetters(32)[1:32], each=3))
replicate_pt2 <- as.factor(as.vector(rep(1:3, 32)))
merged_pt2 <- paste0(rep(myLetters(32)[1:32], each=3),as.vector(rep(1:3, 32)))
sampleList[['plate2']] <- data.frame(sampleId_pt2, exp_condition_pt2, replicate_pt2, merged_pt2)



sampleList[['plate1']] <- rbind(cbind(sampleList[['plate1']][sampleList[['plate1']]$replicate==1,], 'plate pos' = temp_zones[['plate1']]$zone_B1), 
                                cbind(sampleList[['plate1']][sampleList[['plate1']]$replicate==2,], 'plate pos' = temp_zones[['plate1']]$zone_B2),
                                cbind(sampleList[['plate1']][sampleList[['plate1']]$replicate==3,], 'plate pos' = temp_zones[['plate1']]$zone_B3))

sampleList[['plate2']] <- rbind(cbind(sampleList[['plate2']][sampleList[['plate2']]$replicate==1,], 'plate pos' = temp_zones[['plate2']]$zone_B1), 
                                cbind(sampleList[['plate2']][sampleList[['plate2']]$replicate==2,], 'plate pos' = temp_zones[['plate2']]$zone_B2),
                                cbind(sampleList[['plate2']][sampleList[['plate2']]$replicate==3,], 'plate pos' = temp_zones[['plate2']]$zone_B3))

for (n in 1:2){ # loop over the two plates
  for (k in 1:3){ # loop over the temperature zones
    set.seed(seed_set[(n-1)*k + k])
    sampleList[[n]]$`plate pos`[sampleList[[n]]$replicate==k] <- sample(sampleList[[n]]$`plate pos`[sampleList[[n]]$replicate==k])
  }
}

plate_list1 <- data.frame(Zone = as.numeric(sampleList[['plate1']]$replicate), exp_cond = sampleList[['plate1']]$merged, Well=sampleList[['plate1']]$`plate pos`)
plate_list2 <- data.frame(Zone = as.numeric(sampleList[['plate2']]$replicate), exp_cond = sampleList[['plate2']]$merged, Well=sampleList[['plate2']]$`plate pos`)

plate_plot(
  data = plate_list1,
  position = Well,
  label = exp_cond,
  value = Zone,
  plate_size = 96,
  plate_type = "round"
)


plate_plot(
  data = plate_list2,
  position = Well,
  label = exp_cond,
  value = Zone,
  plate_size = 96,
  plate_type = "round"
)
