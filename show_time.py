from datetime import datetime
from importlib.metadata import version
from zoneinfo import ZoneInfo
from babel.dates import format_datetime

moment = datetime.fromisoformat("2026-12-15T17:00:00+00:00")
zone = ZoneInfo("America/Winnipeg")

print("tzdata", version("tzdata"))
print("Winnipeg:", format_datetime(moment, "h:mm a ZZZZ", tzinfo=zone, locale="en"))
