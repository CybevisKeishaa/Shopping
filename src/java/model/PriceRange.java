
package model;

import java.util.List;

public class PriceRange {
    public static final List<PriceRange> values = List.of(
            new PriceRange(1, 0, 500_000),
            new PriceRange(2, 500_000, 1_000_000),
            new PriceRange(3, 1_000_000, 2_000_000),
            new PriceRange(4, 2_000_000, 3_000_000),
            new PriceRange(5, 3_000_000, 4_000_000),
            new PriceRange(6, 4_000_000, Integer.MAX_VALUE)
    );

    public PriceRange() {}
    public PriceRange(int id, int min, int max) {
        this.id = id;
        this.min = min;
        this.max = max;
    }

    private int id;
    private int min;
    private int max;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMin() {
        return min;
    }

    public void setMin(int min) {
        this.min = min;
    }

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }
}