

class AppText {

  static RegExp passRegexp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.{8,}$)');
  static RegExp emailRegexp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

 /// on boarding text
  // Onboarding / Tagline
  static const String compete = "Compete";
  static const String smarter = "smarter";
  static const String trade = "Trade";
  static const String better = "better";

  // Legal / Policy
  static const String byContinuing = "By continuing, you agree to Traders Connect’s ";
  static const String privacyPolicy = "Privacy Policy";
  static const String termsOfUse = "Terms of Use";
  static const String and = " and ";

///create copier section===============================================================

  static const String login = "Login";
  static const String createAccount = "Create an account";
  static const String empowerAnalyzeConnect = "Empower. Analyze. Connect";


  // Buttons / Actions
  static const String continueButton = "Continue";
 // static const String createAccount = "Create your copier";

  // OTP / Verification
  static const String otpInfo = "You will receive a code to confirm your identity";

  // Form Fields / Hints
  static const String emailAddress = "Email Address";
  static const String referralCode = "Referral Code (Optional)";
  static const String phoneNumber = "Phone Number";
  static const String countryRegion = "Country/Region";
  static const String fullName = "Full Name";

  // Onboarding / Info
  static const String startTracking =
      "Start tracking your trades and connect with the world’s top traders.";

  ///verify copier section===============================================================


  static const String verifyEmail = "Verify Email";
  static const String verifyYourIdentity = "Verify your identity";

  // Verification
  static const String haventReceivedCode =
      "Haven’t received the code yet? ";
  static const String sendAgain = "Send again";
  static const String or = " or ";
  static const String changeEmailAddress =
      "Change the email address";

  static const String enterSixDigitCode =
      "Enter the 6-digit code we’ve sent to {{email.address}}.";

  ///create secure password==========================================================


  static const String createSecure="Create a Secure Password";
  static const String protectAccount="Protect your copier with a strong password. Minimum 8 Characters, include a number and symbol";

  static const String enterPass="Enter Password";
  static const String reEnterPass="Re Enter Password";
  static const String passStrength='Password strength:';
  static const String strong=' Strong';
  static const String enableTwoFactor="Enable Two-Factor Authentication";
 static const String useFace="Use Face ID";
 static const String wouldYouLike=   "Would you like to use your Face ID instead of signing in manually?";

  static const String yesEnable="Yes, Enable Face Id";
  static const String notNow="Not Now";

  /// choose your plan===========================================================

  static const String choosePlan="Choose Your Plan";
  static const String monthly="Monthly";
  static const String annually="Annually";

  static const String beginner="Beginners";
  static const String popular="Most Popular";
  static const String tradersConnect="TradersConnect";
  static const String parYear="per year,";
  static const String month="month";
  static const String save="save";
  static const String start14Day="Start your 14-day free trial";
  static const String elite="Elite";
  static const String bestValue='Best Value';


  ///login widget========================================================================================

  static const String loginToYourAccount = "Login to your copier";
  static const String fillInformation =
      "Please fill the information to make it easier for us to get to know you";
  static const String password = "Password";
  static const String forgotYourPassword = "Forgot your password?";

/// password recovery==================================================================


  static const String passwordRecovery = "Password Recovery";
  static const String passwordRecoveryDesc =
      "Please enter your email address to receive a recovery link and reset your password";
  static const String forgotEmail = "Forgot email? ";
  static const String contactSupport = "Contact Support";
  static const String requestPasswordLink = "Request password link";

  ///verify otp widget======================================================================


  static const String enterVerificationCode = "Enter Verification Code";

  static const String verifyCode = "Verify Code";


  ///reset password========================================================================

  static const String resetPassword = "Reset Password";
  static const String createNewPassword = "Create a New Password";
  static const String resetPasswordHint = "Protect your copier with a strong password.Minimum 8 characters, include a number and symbol";

///dashboard========================================================================================


  static const String dashboard = "Dashboard";
  static const String account = "Account";
  static const String overview = "Overview";
  static const String linkedAccounts = "Linked Accounts";
  static const String smartInsights = "Smart Insights";

  // Subscription / Upgrade
  static const String unlockProTrader = "Unlock Pro Trader";
  static const String upgrade = "Upgrade";
  static const String advancedAnalyticsAndCopiers =
      "Advanced analytics & 5 copier accounts";

  // Time Filters
  static const String open = "Open";
  static const String week = "Week";

  static const String year = "Year";

  // Days
  static const String sun = "Sun";
  static const String mon = "Mon";
  static const String tue = "Tue";
  static const String wed = "Wed";
  static const String thu = "Thu";
  static const String fri = "Fri";
  static const String sat = "Sat";

  // Quantity / Limits
  static const String ten = "10";
  static const String fifty = "50";
  static const String hundred = "100";
  static const String oneFifty = "150";
  static const String fiveHundred = "500";
  static const String oneKPlus = "1k+";

  // Account Status
  static const String active = "Active";
  static const String warning = "Warning";
  static const String atRisk = "At Risk";
  static const String disabled = "Disabled";

  // Trading Metrics
  static const String pnl = "PnL";
  static const String winRate = "Win Rate";

  // Brokers
  static const String exness = "Exness";
  static const String icMarkets = "IC Markets";
  static const String stp = "STP";

  // Accounts
  static const String copiersAccounts = "Copiers Accounts";
  static const String masterAccount2 = "Master Account 2";

  // Insights / Rankings
  static const String bestRoiWindow = "Best ROI Window";
  static const String high = " High";
  static const String topTraders = "Top Traders";
  static const String followers = "Followers";

  // Account Selection / Search
  static const String selectAccount = "Select Account";
  static const String showingAllAccounts =
      "Showing the list of all the accounts";
  static const String search = "Search";
  static const String addAccount = "Add Account";
//===========================================================
  static const String name = "Name";
  static const String platform = "Platform";
  static const String type = "Type";
  static const String broker = "Broker";

  static const String eh = "EH";


//============================================================================


  static const accountManagement = "Account Management";
  static const accountSettings = "Account Settings";
  static const accountName = "Account Name";
  static const oldPassword = "Old Password";
  static const newPassword = "New Password";
  static const reEnterNewPassword = "Re-Enter New Password";
  static const saveSettings = "Save Settings";

  static const equityProtector = "Equity Protector";
  static const equityProtection = "Equity Protection";
  static const descriptionWillGoHere = "Description will go here ...";

  static const notificationAlert = "Notification Alert";
  static const disableCopyTrading = "Disable Copy Trading";
  static const closeOpenTrades = "Close Open Trades";

  static const stopLoseProtection = "Stop Lose Protection";
  static const drawdownProtection = "Drawdown Protection";

  static const takeProfitProtection = "Take Profit Protection";
  static const percentProfitProtection = "% Profit Protection";
  static const percentValueProfitProtection = "% Value Profit Protection";
  static const percentAbsoluteMaximum = "% Absolute Maximum";

//===============================================


  static const tradingSymbols = "Trading Symbols";
  static const forex = "Forex";
  static const enabled = "Enabled";

  static const eurUsd = "EURUSD";
  static const gbpUsd = "GBPUSD";
  static const usdChf = "USDCHF";

  static const group = "Group";
  static const accountDetails = "Account Details";
  static const accountNameAddAccount = "Account Name.Add Account";
  static const couldAddAccountContactSupport =
      "Couldn’t add account? Contact Support";

  static const accountId = "Account ID";
  static const selectServer = "Select Server";
  static const selectBroker = "Select Broker";
  static const serverType = "Server Type";
//==============================================================================================

  static const activeTraders = "ActiveTraders";


  static const accentMarketsGroup = "Accent Markets Group";
  static const absoluteMarkets = "Absolute Markets";
  static const aafxTrading = "AAFX Trading";
  static const aafx = "AAFX";
  static const aaafx = "AAAFX";

  static const sixIGroup = "6i Group";
  static const fourTLimited = "4T Limited";
  static const threeSixtyDegreesMarkets = "360 Degrees Markets";
  static const twentyFourPrimeMarkets = "24 Prime Markets";

  static const brokerMissingLetUsKnow = "Broker missing? Let us know";

///copier=======================================================copier============================

  static const copier = "Copier";

  static const disabledMonitorExisting = "Disabled - Monitor Existing";
  static const slavesEnableLabel = "Slaves Enabled:";
  static const disabledLabel = "Disabled:";
  static const masterAccounts = "Master Accounts";
  static const logs = "Logs";
  static const templates = "Templates";
  static const accounts = "Accounts";


  //===========================================================================

  static const masterAccount = "Master Account";
  static const showingListOfAllAccounts = "Showing the list of all the accounts";
  static const deleteMasterAccount = "Delete Master Account";
  static const addSlave = "Add Slave";
  static const masterAccountSettings = "Master Account Settings";

  static const riskType = "Risk Type:";
  static const enabledSlaves = "Enabled Slaves";
  static const slaves = "Slaves";
  static const slaveAccount = "Slave Account";
//===========================================================


  static const settings = "Settings";
  static const configuration = "Configuration";
  static const editSlave = "Edit Slave";
  static const mapSymbols = "Map Symbols";
  static const override = "Override";
  static const tradingHours = "Trading Hours";
  static const deleteSlaveAccount = "Delete Slave Account";

//==================================================================================

  static const copySettings = "Copy Settings";
  static const advanceSettings = "Advance Settings";

  static const copyPendingOrders = "Copy Pending Orders";
  static const copyTakeProfit = "Copy Take Profit";
  static const copyStopLoss = "Copy Stop Loss";

  static const otherProtection = "Other Protection";
  static const riskSettingsPercent = "Risk Settings - 100% = 1 to 1 risk";

  static const copyToAccount = "Copy to Account";
  static const copyFromAccount = "Copy from Account";

  //==============================================================================

  // static const exness = "Exness";
  // static const active = "Active";
  static const mt4104392 = "MT4-104392";
//===============================================================
  static const calculateRiskSettings = "Calculate Risk Settings";
  static const lotRefiner = "Lot Refiner";
  static const customPlacedType = "Custom Placed Type";
  static const enterMagicNumber = "Enter Magic Number";
  static const copyMagicNumberMT4Only = "Copy Magic Number (MT4 only)";
  static const enterCustomComment = "Enter Custom Comment";
  static const copyTradeAccount = "Copy Trade Account";
  static const strictClose = "Strict Close";

//============================================================================

  static const applyRiskSettings = "Apply Risk Settings";
  static const calculate = "Calculate";
  static const slaveTradeRisk = "Slave Trade Risk";
  static const masterTradeRisk = "Master trade Risk";
  static const fixedLot = "Fixed Lot";
  static const lotBased = "Lot Based";
  static const based = "Based";
  static const calculateRisk = "Calculate Risk";
  static const riskSettings = "Risk Settings";
  static const apply = "Apply";
  static const cancel = "Cancel";

  //============================================================


  static const addMapSymbol = "Add Map Symbol";
  static const mapFromSymbol = "Map From Symbol";
  static const mapToSymbol = "Map To Symbol";
  static const createMapping = "Create Mapping";
  static const symbolsMapped = "Symbols Mapped";

  static const label = "Label";
  static const from = "From";
  static const to = "To";

  static const showingListOfAllSymbols = "Showing the list of all the symbols";
  static const addSymbol = "Add Symbol";


  static const addTradingHours = "Add Trading Hours";
  static const addedTradingHours = "Added Trading Hours";

  static const monday = "Monday";
  static const start = "Start:";
  static const end = "End:";
  static const tuesday = "Tuesday";
  static const wednesday = "Wednesday";
  static const day = "Day";
  static const addTradingHour = "Add Trading Hour";

  //=========================================================================================

  // static const copier = "Copier";
  // static const accounts = "Accounts";
  // static const templates = "Templates";
  // static const logs = "Logs";
  // static const enabled = "Enabled";
  // static const riskType = "Risk Type";
  // static const riskSettings = "Risk Settings";
  //
  // static const otherProtection = "Other Protection";
  // static const copyStopLoss = "Copy Stop Loss";
  // static const copyTakeProfit = "Copy Take Profit";
  // static const copyPendingOrders = "Copy Pending Orders";
  //
  // static const advanceSettings = "Advance Settings";

  static const templatesCopier = "TemplatesCopier";


  static const testTemplate = "Test Template";
  static const typeRotMultiplierRiskSettings100 = "Type: Rot Multiplier   Risk Settings: 100%";

  static const templateSettings = "Template Settings";


  static const copySL = "Copy SL";
  static const copyTP = "Copy TP";
  static const copyPending = "Copy Pending";

  static const lotMultiplier = "Lot Multiplier";
  static const activated = "Activated";

  static const editTemplate = "Edit Template";
  static const copierTemplateSettings = "Copier Template Settings";
  static const templateName = "Template Name";

  static const saveTemplate = "Save Template";
  static const forceMinimum ="Force Minimum Lot Size";

///======================================================Analyzer====================================================================


  static const average = "AVERAGE";
  static const expectancy = "Expectacy";
  static const limitedToMinus8Percent = "Limited to ≤ −8%";
  // static const winRate = "Win Rate";
  // static const warning = "WARNING";
  // static const high = "High";
  static const dailyDrawdown = "Daily Drawdown";
  static const dailyReturns = "Daily returns";
  static const rfZeroPercent = "RF=0%";
  static const healthy = "HEALTHY";
  static const sharpeRatio = "Sharpe Ratio";
  static const good = "GOOD";
  static const profitFactor = "Profit Factor";
  static const keyMetrics = "Key Metrics";
  static const aiInsights = "AI Insights";

  static const openTrades = "Open Trades";
  static const worstMonth = "Worst Month";
  static const equity = "Equity";
  static const totalPnL = "Total PNL";
  static const statistics = "Statistics";
  static const instrumentROIPatterns = "Instrument ROI Patterns";
  static const performanceROI = "Performance ROI";
  static const portfolioROI = "Portfolio ROI";
  static const analysisHub = "Analysis Hub";
  static const performance = "Performance";
  static const analyzer = "Analyzer";

//=============================================================================


  static const stable = "Stable";
  static const note = "Note";
  static const higherVolume = "HIGHER VOLUME";
  static const nas100 = "NAS100";
  static const stableCaps = "STABLE";
  //static const eurUsd = "EURUSD";
  static const bestInstrument = "BEST INSTRUMENT";
  static const xauUsd = "XAUUSD";
  static const roiHeatmapAndTrades = "ROI Heatmap & Trades";

//=============================================================================================



  static const pl = "P/L";
  static const exit = "Exit";
  static const entry = "Entry";
  static const side = "Side";
  static const last10Trades = "Last 10 Trades";
  static const riskMonitorsAndAlerts = "Risk Monitors & Alerts";

//=================================================================================================


  static const riskMonitor = "Risk Monitor";
  static const closeToCap = "CLOSE TO CAP";
  static const context = "Context";
  static const warningMargin = "Warning: Margin";
  static const criticalRisk = "Critical: Risk";
  static const riskAlerts = "Risk Alerts";
  static const ruleBreaches = "Rule Breaches";
  static const lotSizeCompliance = "Lot Size Compliance";
  static const dailyLossPercent = "Daily Loss %";

  //==================================================================================

  static const filter = "Filter";
  static const accountType = "Account Type";
  static const selectCurrency = "Select Currency";
  static const dateRange = "Date Range";
  static const applyFilter = "Apply Filter";

  //static const overview = "Overview";
  static const dates = "Dates";
  static const drawdownPercent = "Drawdown %";
  static const drawdownSeries = "Drawdown Series";

  static const returnBuckets = "Return buckets";
  static const returnDistribution = "Return Distribution";
  static const maxDrawdown = "Max Drawdown";
  //static const profitFactor = "Profit Facto";
  static const roi = "ROI";
  static const equityCurve = "Equity Curve";
  static const riskAndConsistency = "Risk & Consistency";
  static const roiBreakdown = "ROI Breakdown";
  //====================================================================

  static const stagingAndPattern = "Staging & Pattern";
  static const brokerExecution = "Broker Execution";
  static const tradesExplorer = "Trades Explorer";
  static const instrumentROITable = "Instrument ROI Table";
  static const sessionAnalysis = "Session Analysis";
  static const asia = "Asia";
  static const london = "London";
  static const newYork = "New York";
  static const holdingTimeVsReturn = "Holding Time vs Return";
  static const holdingTimeBuckets = "Holding time buckets";

  //==============================================================================
  static const losingStreaksAndRecovery = "Losing Streaks & Recovery";
  static const worstStreakDays = "Worst Streak Days";
  static const worstStreakDay = "Worst Streak Day";
  static const recoveredAfterWorstDrawdown = "Recovered after Worst Drawdow";
  static const consistencyScore = "Consistency Score";
  static const rollingWinRate = "Rolling Win Rate";
  static const winRatePercent = "Win Rate %";
  static const trades = "Trades";
  static const rollingProfitFactor = "Rolling Profit Factor";
  //static const profitFactor = "Profit Factor";
  static const rollingDrawdown = "Rolling Drawdown";
 // static const drawdownPercent = "Drawdown %";
  static const pf = "PF";
  static const drawdown = "drawdown";

//===================================================================================================
  static const entryExitTypesCounts = "Entry/Exit Types (Counts)";
  static const scaleInTrades = "Scale in Trades";
  static const timeRelativeToNewsRelease = "Time relative to news release";
  static const durationBands = "Duration Bands";
  static const countOfTrades = "Count of Trades";
  static const pullback = "Pullback";
  static const newsFade = "News Fade";
  static const roiPercent = "ROI%";
  static const meanRevert = "Mean Revert";
  static const expR = "Exp. (R)";
  static const breakoutV2 = "Breakout v2";
  static const tagPerformance = "Tag Performance";
  static const tenCounts = "10 Counts";
  static const manual = "Manual";
  static const stop = "Stop";
  static const limit = "Limit";
  static const market = "Market";

//====================================================================

  static const brokerScorecard = "Broker Scorecard";
  static const spreadSpikes = "Spread Spikes";
  static const latencyOutliers = "Latency Outliers";
  static const slippageSpikes = "Slippage Spikes";
  static const anomaliesManipulationAlerts = "Anomalies / Manipulation Alerts";
  static const spreadPips = "Spread (pips)";
  static const spread = "Spread";
  static const p95SlippagePips = "P95 Slippage (pips)";
  static const avgSlippagePips = "Avg Slippage (pips)";
  static const slippageBySymbol = "Slippage by Symbol";
  static const maxMs = "Max. (ms)";
  static const minMs = "Min. (ms)";
  static const avgMs = "Avg. (ms)";

  //===================================================================================
  //static const tradesExplorer = "Trades Explorer";
  static const tag = "Tag";
  static const symbol = "Symbol";
  static const date = "Date";
  //static const account = "Account";
  //static const exit = "Exit";
  static const lot = "Lot";
  static const sell = "Sell";
  //static const side = "Side";
  static const totalRoi = "Total ROI";
  static const totalPl = "Total P/L";
  static const recentTrades = "Recent Trades";
  //static const riskAndConsistency = "Risk & Consistency";
 // static const roiBreakdown = "ROI Breakdown";
  static const aiInsightsTrail = "AI Insights Trail";


  //==================================================================================================

  static const medium = "Medium";
  static const strengthLondonOpenOnXauUsd = "Strength — London open on XAUUSD";
  //static const strong = "Strong";
  static const aiInsightsRail = "AI Insights Rail";

  //=======================================================================================================


  static const propFirms = "Prop Firms";
  static const compare = "Compare";
  static const fundedNext = "FundedNext";
  static const e8Markets = "E8 Markets";
  static const dailyDd = "Daily DD";
  static const leverage = "Leverage";
  static const maxAllocation = "Max Allocation:";

  static const alphaCapital = "Alpha Capital";
  static const selectToCompare = "Select to Compare";
  static const the5ers = "The5ers";
  static const pinned = "Pinned";
  static const fundingPips = "FundingPips";
  static const comparePropFirms = "Compare Prop Firms";
  static const propFirmsLeaderboard = "Prop Firms Leaderboard";
  static const addAnotherFirm = "Add Another Firm";
  static const selectPropFirm2 = "Select Prop Firm 2";

//====================================================================


  static const programType = "Program Type";
  static const platforms = "Platforms";
  static const assets = "Assets";
  static const yearsInOperation = "Years in Operation";
  static const country = "Country";
  static const minimumRating = "Minimum Rating";
  static const typeOfFirm = "Type of Firm";
  static const filterPropFirms = "Filter Prop Firms";
  static const showingListOfAllPropFirms = "Showing the list of all the prop firms";
  static const applyFilters = "Apply Filters";

  //=======================================================================================
  static const comparison = "Comparison";
  static const payoutSpeedDays = "Payout Speed (Days)";
  static const payout = "Payout";
  static const profitTargetPercent = "Profit Target %";
  static const maxDrawdownPercent = "Max Drawdown %";
  static const dailyDrawdownPercent = "Daily Drawdown %";
  static const evaluationType = "Evaluation Type";
  static const leverageFundingAndRules = "Leverage.Funding & Rules";
  static const usersInPlatform = "Users in Platform";
  static const platformsAndMarkets = "Platforms & Markets";
  static const costsAndPerks = "Costs & Perks";
  static const the5evers = "The5evers";
  //=====================================================================


  static const firmDetails = "Firm Details";
  static const threeSteps = "3-Steps";
  static const twoSteps = "2-Steps";
  static const oneStep = "1-Step";
  static const instant = "Instant";

  static const crypto = "Crypto";
  static const energy = "Energy";
  static const indices = "Indices";
  static const metals = "Metals";
  static const fx = "FX";
  //static const leverage = "Leverage";
  static const paymentMethods = "Payment Methods";
  static const dateCreated = "Date Created";
  static const trustPilot = "Trust Pilot";
  static const ceo = "CEO";
  static const unitedArabEmiratesAE = "United Arab Emirates (AE)";
  static const generalInformation = "General Information";
  static const announcements = "Announcements";
  static const firmRules = "Firm Rules";



///sentiments=======================================================================================================
  static const analyze = "Analyze";
  static const addToWatchlist = "Add to watchlist";
  static const bearish = "BEARISH";
  static const reuters = "Reuters";
  static const marketNews = "Market News";
  static const timeOfDayHeat = "Time-of-day Heat";
  static const low = "LOW";
  static const stocks = "Stocks";
  static const googl = "GOOGL";
 // static const medium = "MEDIUM";
  static const details = "Details";
  static const extremeWatchlist = "Extreme Watchlist";
  static const commodities = "Commodities";
 //static const crypto = "Crypto";
  //static const indices = "Indices";
  static const watchlist = "Watchlist";
  static const allInstruments = "All Instruments";
  static const sentiments = "Sentiments";



  ///market news=======================================================================================================
 // static const nas100 = "NAS100";
  static const us500 = "US500";
  static const reuters40mAgo = "Reuters - 40m ago";
  static const bullish = "BULLISH";
  //static const save = "Save";
  static const shareRead = "Share.Read";
  static const saved = "Saved";
  static const allNews = "All News";

  static const highCapital = "HIGH";
  static const mediumCapital = "MEDIUM";
  static const bearishCapital = "BEARISH";


  ///calender=======================================================================================================
  static const alert = "Alert";
  static const economicCalendar = "Economic Calendar";

  ///leader board=======================================================================================================
  static const standings = "Standings";
  static const challenges = "Challenges";
  static const riskAdjusted = "Risk Adjusted";
  static const overall = "Overall";
  static const leaderboard = "Leaderboard";

///live chat social media=======================================================================

  static const share = "Share";
  static const comment = "Comment";
  static const like = "Like";
 // static const equityCurve = "EquityCurve";
  static const riskManagement = "RiskManagement";
  static const postNow = "Post Now";
  static const liked = "Liked";
  static const posts = "Posts";
  static const following = "Following";
  //static const followers = "Followers";
  static const liveFeed = "Live Feed";
  static const socialHub = "Social Hub";
  static const threadReply = "Thread Reply";
  static const sendAMessage = "Send a message";
  static const liveChat = "Live Chat";

  ///profile setting=======================================================================
  static const starter = "Starter";
  static const daysRemaining = "Days Remaining";
  static const liveDetector = "Live Detector";
  //====================================================================================
  static const renewalsFailedPayments = "Renewals, failed payments";
 // static const drawdown = "Drawdown";
 // static const equityProtector = "Equity Protector";
  static const maxLoss = "Max Loss";
  static const asiaDubai2200to0700 = "22:00 → 07:00 (Asia/Dubai)";
  static const alwaysDeliverIgnoresQuietHours = "Always deliver (ignores quiet hours)";
  static const billingAndPlan = "Billing & Plan";
  //static const riskAlerts = "Risk Alerts";
  static const quietHours = "Quiet Hours";
  static const highImpactAlerts = "High-Impact Alerts";
  static const notificationSettings = "Notification Settings";
  //static const high = "HIGH";
  static const risk = "RISK";
  static const yesterday = "Yesterday";
  static const instruments = "Instruments";
  static const alerts = "Alerts";
  static const system = "System";
  static const unread = "Unread";
  static const notifications = "Notificati ons"; // spelling preserved as provided
//============================================================================================================


  static const manageAccounts = "Manage Accounts";
  static const primaryExness = "Primary - Exness";
//  static const linkedAccounts = "Linked Accounts";
  static const invoices = "Invoices";
  static const changePlan = "Change Plan";
  static const monthlyAlerts = "Monthly Alerts";
  static const connectedAccountsPlansAndUsage = "Connected AccountsPlans & Usage";
  static const newCopiers = "New Copiers";
  static const alertsRead = "Alerts Read";
  static const alertsReceived = "Alerts Received";
 // static const login = "Login";
  static const deleteAccount = "Delete Account";
  static const legal = "Legal";
  static const support = "Support";
  static const devices = "Devices";
//  static const notifications = "Notifications";
  static const billing = "Billing";
  static const security = "Security";
  static const profileAndSettings = "Profile & Settings";
//===================================================================================================


  static const twoStepVerification2FA = "Two‑Step Verification (2FA)";
  static const recommendedUseAuthenticatorApp =
      "Recommended: use an authenticator app. Backup codes are generated automatically.";
  static const changePassword = "Change Password";
  static const updatePassword = "Update Password";
  static const backupCodes = "Backup Codes";
  static const useIfYouLoseYourDevice = "Use if you lose your device";
  static const regenerate = "Regenerate";
  //=======================================================================================


  static const nextPayment = "Next Payment";
  static const planFees = "Plan Fees";
  static const planName = "Plan Name";
  static const planDetails = "Plan Details";
  static const paid = "PAID";
  static const download = "DOWNLOAD";
  static const showingFullListOfAllInvoices =
      "Showing full list of all the invoices";

  static const addCard = "Add Card";
  static const primaryMethodUsedForRenewals =
      "Primary method used for renewals";
  //static const paymentMethods = "Payment Methods";

  static const linkedTradingAccounts = "Linked Trading Accounts";

  static const updateHours = "Update Hours";
  static const highImpactAlertsBypassQuietHours =
      "High-impact alerts will bypass quiet hours when enabled";

  static const selectEndTime = "Select End Time";
  static const selectStartTime = "Select Start Time";
  static const selectTimeZone = "Select Time Zone";

 // static const accounts = "Accounts";
//  static const instruments = "Instruments";
  //static const risk = "Risk";

  static const highImpactOverride = "High-impact override";
  static const email = "Email";
  static const pushNotifications = "Push Notifications";


}
