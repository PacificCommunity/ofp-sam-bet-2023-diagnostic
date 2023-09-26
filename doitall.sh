#!/bin/sh
#  ------------------------
#  PHASE 0 - create initial par file
#  ------------------------
#

  mfclo64 bet.frq bet.ini 00.par -makepar

#
#  ------------------------
#  PHASE 1 - initial par
#  ------------------------
#

  mfclo64 bet.frq 00.par 01.par -file - <<PHASE1
#------------------------------------------------------------------------------
# Initial phase control option
# Using default quasi-Newton minimizer
  1 351 0 1 192 0
#
  1 32 7          # This is a change from 2014 that allows all growth parameters to be fixed during the contol phase
# Richards growth settings
  1 226 0
  1 227 0
#
#------------------------------------------------------------------------------
# Catch conditioned flags
#  general activation
  1 373 1         # activated CC with Baranov equation
  1 393 0         # activate estimation of: kludged_equilib_coffs, and implicit_fm_level_regression_pars
  2 92 2          # specifies the catch-conditioned option with Baranov equation
# - catch equation bounds
  2 116 70        # value for Zmax_fish in the catch equations
  2 189 80        # the fraction of Zmax_fish above which the penalty is calculated
  1 382 300       # weight for Zmax_fish penalty - set to 300 to avoid triggering Zmax_flag=1. Found by T&E.
# De-activate any catch errors flags
  -999 1 0
  -999 4 0
  -999 10 0
  -999 15 0
  -999 13 0
# -- survey fisheries defined
#  Index wt   Time varying CV
#  CPUE variation Index wt   Time varying CV
  -33 94 1     -33 92 88    -33 66 0
  -34 94 1     -34 92 53    -34 66 0
  -35 94 1     -35 92 130   -35 66 0
  -36 94 1     -36 92 109   -36 66 0
  -37 94 1     -37 92 76    -37 66 0
  -38 94 1     -38 92 93    -38 66 0
  -39 94 1     -39 92 121   -39 66 0
  -40 94 1     -40 92 77    -40 66 0
  -41 94 1     -41 92 23    -41 66 0
# -- Grouping flags for survey CPUE
    -1 99 1
    -2 99 2
    -3 99 3
    -4 99 4
    -5 99 5
    -6 99 6
    -7 99 7
    -8 99 8
    -9 99 9
   -10 99 10
   -11 99 11
   -12 99 12
   -13 99 13
   -14 99 14
   -15 99 15
   -16 99 16
   -17 99 17
   -18 99 18
   -19 99 19
   -20 99 20
   -21 99 21
   -22 99 22
   -23 99 23
   -24 99 24
   -25 99 25
   -26 99 26
   -27 99 27
   -28 99 28
   -29 99 29
   -30 99 30
   -31 99 31
   -32 99 32
   -33 99 33
   -34 99 33
   -35 99 33
   -36 99 33
   -37 99 33
   -38 99 33
   -39 99 33
   -40 99 33
   -41 99 33
#
#------------------------------------------------------------------------------
# Recruitment and initial population settings
  1 149 100       # recruitment deviations penalty
  1 400 6         # Final six recruitment deviates set to 0
  1 398 1         # Fixed terminal recruitments are the arithmetic mean of the remaining period (not the default geometric mean)
  2 177 1         # use old totpop scaling method
  2 32 1          # and estimate the totpop parameter
  2 93 4          # sets no. of recruitments per year to 4 (is this used?)
  2 57 4          # sets no. of recruitments per year to 4
  2 94 1 2 128 10 # initial age structure based on 1.0*M(age) - initial F set to zero

#
#------------------------------------------------------------------------------
# Likelihood component settings
#
  1 111 4         # sets likelihood function for tags to negative binomial
  1 141 3         # sets likelihood function for LF data to normal
  1 139 3         # sets likelihood function for WF data to normal
  -999 49 20      # divide LF sample sizes by 20 (default=10)
  -999 50 20      # divide WF sample sizes by 20 (default=10)
# For longline ALL and Index fisheries reduce the sample size in half so we aren't double counting the sample sizes
  -1 49 40    -1 50 40
  -2 49 40    -2 50 40
  -4 49 40    -4 50 40
  -7 49 40    -7 50 40
  -8 49 40    -8 50 40
  -9 49 40    -9 50 40
  -11 49 40    -11 50 40
  -12 49 40    -12 50 40
  -29 49 40    -29 50 40
  -33 49 40    -33 50 40
  -34 49 40    -34 50 40
  -35 49 40    -35 50 40
  -36 49 40    -36 50 40
  -37 49 40    -37 50 40
  -38 49 40    -38 50 40
  -39 49 40    -39 50 40
  -40 49 40    -40 50 40
  -41 49 40    -41 50 40
#
#
#------------------------------------------------------------------------------
# Tag dynamics settings
#
  1 33 99         # maximum tag reporting rate for all fisheries is 0.99
  2 96 30         # tag pooling at 30 quarters after release so not to have to follow them forever
  -9999 1 2       # sets no. mixing periods for all tag release groups to 2
  2 198 1         # Estimate tag reporting rates in new tag group / fishery structure
  -999 43 0       # group all tags for variance estimation
  -999 44 0       # estimate tag variance for all fisheries if =1
#
# grouping of fisheries for tag return data
  -1 32 1
  -2 32 2
  -3 32 3
  -4 32 4
  -5 32 5
  -6 32 6
  -7 32 7
  -8 32 8
  -9 32 9
  -10 32 10
  -11 32 11
  -12 32 12
  -13 32 13
  -14 32 13
  -15 32 14
  -16 32 14
  -17 32 15
  -18 32 15
  -19 32 16
  -20 32 17
  -21 32 18
  -22 32 19
  -23 32 15
  -24 32 15
  -25 32 20
  -26 32 20
  -27 32 21
  -28 32 22
  -29 32 23
  -30 32 24
  -31 32 24
  -32 32 25
  -33 32 26
  -34 32 26
  -35 32 26
  -36 32 26
  -37 32 26
  -38 32 26
  -39 32 26
  -40 32 26
  -41 32 26
#
#
#------------------------------------------------------------------------------
#
# Selectivity settings
#
  -999 3 37        # all selectivities equal for age class 37 and older
  -999 26 2        # sets length-dependent selectivity option
  -999 57 3        # uses cubic spline selectivity
  -999 61 5        # with 5 nodes for cubic spline

# grouping of fisheries with common selectivity
  -1  24  1 # LL ALL 1
  -2  24  2 # LL ALL 2
  -3  24  3 # LL US 2
  -4  24  4 # LL ALL 3
  -9  24  5 # LL ALL 4
  -12 24  6 # LL ALL 6
  -11 24  7 # LL ALL 5
  -29 24  7 # LL ALL 9
  -5  24  8 # LL OS 3
  -6  24  9 # LL OS 7
  -7  24 10 # LL ALL 7
  -8  24 11 # LL ALL 8
  -10 24 12 # LL AU 5
  -27 24 12 # LL AU 9
  -13 24 13 # PS ASS 3
  -30 24 13 # PS ASS 7
  -15 24 14 # PS ASS 4
  -25 24 15 # PS ASS 8
  -14 24 16 # PS UNS 3
  -31 24 16 # PS UNA 7      # PS PHID 7
  -16 24 17 # PS UNS 4
  -26 24 18 # PS UNS 8
  -17 24 19 # MISC PH 7     # Dom PH
  -18 24 20 # HL PHID 7     # HL ID PH
  -19 24 21 # PS JP 1
  -20 24 22 # PL JP 1
  -21 24 23 # PL JP 3
  -22 24 24 # PL JP 8
  -23 24 25 # MISC ID 7     # Dom ID and VN PL region 7
  -24 24 26 # PS PHID 7
  -28 24 27 # PL ALL 7
  -32 24 28 # MISC VN 7
  -33 24 29 # Index fisheries
  -34 24 29
  -35 24 29
  -36 24 29
  -37 24 29
  -38 24 29
  -39 24 29
  -40 24 29
  -41 24 29
# Non-Decreasing Selectivity for at least one index/longline fishery in each region #John suggests modifying this later - just for index fisheries
  -6 16 1
# make other longline selectivites 0 for the first two age classes
  -2   75 2
  -4   75 2
  -5   75 2
  -6   75 2
  -7   75 2
  -9   75 2
  -11  75 2
  -12  75 2
  -29  75 2
# make HL.PHID.7 selectivites 0 for the first 5 age classes
  -18  75 5

  -13 16 2  -13 3 25         # FAD fisheries age-based with splines and set to zero above 25 quarters
  -15 16 2  -15 3 25
  -25 16 2  -25 3 25
  -30 16 2  -30 3 25

  -14 16 2  -14 3 30         # Free school fisheries
  -16 16 2  -16 3 30
  -26 16 2  -26 3 30
  -31 16 2  -31 3 30

#  -17 16 2 -17 3 12          # Forcing selectivity to zero for large fish in the small MISC fisheries
#  -23 16 2 -23 3 12
  -24 16 2 -24 3 12
#  -28 16 2 -28 3 12
#  -32 16 2 -32 3 12
  -19 16 2 -19 3 25          # And also for the PL fisheries
  -20 16 2 -20 3 25
#  -21 16 2 -21 3 25
#  -22 16 2 -22 3 25

  # Forcing selectivity to zero for large fish in the small MISC fisheries _Nicholas' fixSelBump additional step
  -17 16 2 -17 3 9
  -21 16 2 -21 3 10
  -22 16 2 -22 3 7
  -23 16 2 -23 3 6
  -28 16 2 -28 3 7
  -32 16 2 -32 3 9

# Set first age class for PS and PL fisheries to 0 so as not to have weird recruitment distributions (From YFT)
# Fisheries 13-16, 19-22, 25, 26 30 31
# Deleted from BET. Improved length likelihood but overall likelihood worse (due to tags)
#  -13 75 1  # etc
# Turn on weighted spline for calculating maturity at age
  2 188 2

# Set Lorenzen M
  2 109 3        # Specifies Lorenzen
  1 121 0        # But not estimate the scaling parameter yet
# Filter out comps with input samples less than 50
  1 311 1                # Set tail compression for LF data
  1 301 1                # Set tail compression for WF data
  1 313 0                # Proportions in compressed tails for LF data
  1 303 0                # Proportions in compressed tails for WF data
  1 312 50               # Set minimum obs sample size for LF data
  1 302 50               # Set minimum obs sample size for WF data
# v2.2.2.0 VB variance fix
  1 34 0                             # Set to 1 34 1 for backwards compatibility
PHASE1

#------------------------------------------------------------------------------
#
#
#------------------------------------------------------------------------------
#   PHASE 2
#------------------------------------------------------------------------------

  mfclo64 bet.frq 01.par 02.par -file - <<PHASE2
  1 1 100         # set max. number of function evaluations per phase to 100
  1 50 0          # set convergence criterion to 1
  2 113 0         # scaling init pop - turned off
  1 190 1         # write plot-xxx.par.rep
PHASE2

#------------------------------------------------------------------------------
#   PHASE 3
#------------------------------------------------------------------------------

  mfclo64 bet.frq 02.par 03.par -file - <<PHASE3
  2 70 1          # activate parameters and turn on
  2 71 1          # estimation of temporal changes in recruitment distribution
  2 178 1         # constraint on regional recruitments to be equal to one each model period #SJH2014
  1 1 200
PHASE3

#------------------------------------------------------------------------------
#   PHASE 4
#------------------------------------------------------------------------------

  mfclo64 bet.frq 03.par 04.par -file - <<PHASE4
  2 68 1          # estimate movement coefficients
  2 69 1
  2 27 -1         # penalty wt 0.1 computed against prior
PHASE4

#------------------------------------------------------------------------------
#   PHASE 5
#------------------------------------------------------------------------------

  mfclo64 bet.frq 04.par 05.par -file - <<PHASE5
  -100000 1 1     # estimate
  -100000 2 1     # time-invariant
  -100000 3 1     # distribution
  -100000 4 1     # of
  -100000 5 1     # recruitment
  -100000 6 1
  -100000 7 1
  -100000 8 1
  -100000 9 1
PHASE5

#------------------------------------------------------------------------------
#   PHASE 6
#------------------------------------------------------------------------------

  mfclo64 bet.frq 05.par 06.par -file - <<PHASE6
  1 240 1         # Fit to age-length data
  1 14 1          # estimate von Bertalanffy K
  1 12 1          # and mean length of age 1
  1 13 1          # and mean length of age n
  1 1 300         # function evaluations
PHASE6

#------------------------------------------------------------------------------
#   PHASE 7
#------------------------------------------------------------------------------

  mfclo64 bet.frq 06.par 07.par -file - <<PHASE7
  1 15 1       # estimate "generic" SD of length-at-age
  1 16 1       # estimate length dependent SD
  1 173 0      # activate independent mean lengths for 1st 8 age classes
  1 182 0      # penalty weight
  1 184 0      # estimate parameters
  1 1 500      # function evaluations
PHASE7

#------------------------------------------------------------------------------
#   PHASE 8
#------------------------------------------------------------------------------

  mfclo64 bet.frq 07.par 08.par -file - <<PHASE8
  2 145 1       # use SRR parameters - low penalty for deviation
  2 146 1        # estimate SRR parameters
  2 182 1        # make SRR annual rather than quarterly
  2 161 1        # lognormal bias correction
  2 163 0        # use steepness parameterization of B&H SRR
  1 149 0              # set to 0 for the moment
  2 147 1              # time period between spawning and recruitment
  2 148 20       # period for MSY calc - last 20 quarters
  2 155 4              # but not including last year
  2 199 212      # start period for SRR estimation/yield is start 1965?
  2 200 6        # end period for SRR estimation is mid 2017
  -999 55 1      # Do impact analysis
  2 171 1        # Include SRR-based equilibrium recruitment to compute unfished biomass
  1 186 1           # Write fishmort and plotq0.rep
  1 187 1           # Write temporary_tag_report
  1 188 1           # Write ests.rep
  1 189 1           # Write .fit files
  1 1 500       # function evaluations for the final phase - TO BEGIN WITH
  1 50 -2        # convergence criteria
  2 116 100      # increase F bound for NR to 1.0
PHASE8

#------------------------------------------------------------------------------
#   PHASE 9
#------------------------------------------------------------------------------

  mfclo64 bet.frq 08.par 09.par -file - <<PHASE9
  2 145 -1       # use SRR parameters - low penalty for deviation
  1 1 500        # function evaluations for the final phase - TO BEGIN WITH
  1 50 -2        # convergence criteria
  2 116 300      # increase F bound for NR to 3.0
PHASE9

#
# ---------
#  PHASE 10 Estimate Lorenzen M scaling parameter
# ---------

  mfclo64 bet.frq 09.par 10.par -file - <<PHASE10
  1 1 10000      # function evaluations for the final phase - TO BEGIN WITH
  1 50 -5        # convergence criteria
  1 121 1        # Estimate scaling parameter for Lorenzen (age_pars(5,1))
PHASE10

#
#
# ---------
#  PHASE 11 Extra phase added to doitall
# ---------

  mfclo64 bet.frq 10.par 11.par -file - <<PHASE11
  1 1 5000
  1 50 -5        # convergence criteria
PHASE11
