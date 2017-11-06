import time
from datetime import datetime


def xmrStakParser(logger, line):

    date = time.mktime(datetime.now().timetuple())
    tags = ('miner', 'xmr-stak')

    lineWithTotals = line.startswith('Totals:')
    lineWithAcceptedResult = line.endswith('Result accepted by the pool.')
    lineWithChangedDifficulty = 'Difficulty changed. Now:' in line
    if lineWithTotals:
        metric_value = int(float(line.split('Totals:   ')[1].split(' ')[0]))
        metric_name = 'hashrate'
        metric_attributes = {
            'tags': tags,
            'metric_type': 'rate',
        }
        # print metric_value
        return (metric_name, date, metric_value, metric_attributes)

    if lineWithAcceptedResult:
        metric_value = 1
        metric_name = 'accepted_results_by_the_pool'
        metric_attributes = {
            'tags': tags,
            'metric_type': 'count',
        }
        # print metric_value
        return (metric_name, date, metric_value, metric_attributes)

    if lineWithChangedDifficulty:
        metric_value = int(line.split(
            'Difficulty changed. Now:')[1].split('.')[0])
        metric_name = 'difficulty'
        metric_attributes = {
            'tags': tags,
            'metric_type': 'rate',
        }
        # print metric_value
        return (metric_name, date, metric_value, metric_attributes)

#line1 = 'Totals:   4242.5 4242.4  (na) H/s'
#line2 = 'Highest:  4243.4 H/s'
#line3 = '[2017-11-04 17:09:10] : Result accepted by the pool.'
#line4 = 'Difficulty changed. Now: 107821.'
#xmrStakParser(None, line4)

