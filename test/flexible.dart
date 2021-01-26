        flexibleSpace: Container(
          color: Colors.white,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: TabBar(
                    labelColor: Colors.red,
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    indicatorWeight: 4,
                    indicatorColor: Colors.red[600],
                    controller: _tabController,
                    tabs: _tab,
                  ),
                ),
              ],
            ),
          ),
        ),