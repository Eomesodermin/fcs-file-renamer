
# Environment Set up
rm(list = ls()) #Clean workspace
cat("\014")     #Clean Console
gc() # Free memory



##########################################
# User Input
##########################################

output.path <- "output/" # Relative to script file path

input.path <- "input/" # Relative to script file path





###################
# Install packages
###################

pkgs <- c( "rstudioapi", "flowCore")

for(i in 1:length(pkgs)){
  if(!require(pkgs[i], character.only = T)){
    install.packages(pkgs[i])
    require(pkgs[i], character.only = T)
  }else{
    require(pkgs[i], character.only = T)
  }
}


# Set working directory to source file location
setwd(dirname(getActiveDocumentContext()$path))


# Create output folder
if(!dir.exists(output.path)){
  dir.create(output.path)
}


# Read in files
files <- list.files(input.path, pattern = ".fcs")


# amend the metadata to match with file name
for(i in seq_along(files)){
  
  data.input <- read.FCS(paste0(input.path, files[i]),
                         transformation = FALSE,
                         truncate_max_range = FALSE)
  
  
  
  name.var <- gsub(paste0(input.path), "", data.input@description$FILENAME)
  
  data.input@description$`$FIL` <- name.var
  
  data.input@description$TUBENAME <- gsub(".fcs", "", name.var)
  
  write.FCS(data.input, paste0(output.path, files[i]))
  
}


