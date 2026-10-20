from datetime import datetime
from importlib.metadata import version
from zoneinfo import ZoneInfo
from babel.dates import format_datetime

moment = datetime.fromisoformat("2026-12-15T17:00:00+00:00")
winnipeg_zone = ZoneInfo("America/Winnipeg")
ny_zone = ZoneInfo("America/New_York")

print("tzdata", version("tzdata"))
print("babel", version("babel"))

# The time will differ depending on
print("Winnipeg:", format_datetime(moment, "h:mm a ZZZZ", tzinfo=winnipeg_zone, locale="en"))
print("New York:", format_datetime(moment, "h:mm a ZZZZ", tzinfo=ny_zone, locale="en"))
