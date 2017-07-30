module Timesplit
  class Split

    SECS = 60

    def self.[](*values)
      new(*values)
    end

    def initialize(*times)
      times = times.first.split(/[^\d]+/).map(&:to_i) if times.first.is_a? String
      multiplier = 1
      @seconds = times.reverse.reduce do |t, n|
        t += n * (multiplier *= SECS)
      end
    end

    def hours
      calculate_parts[0]
    end

    def minutes
      calculate_parts[1]
    end

    def seconds
      calculate_parts[2]
    end

    def to_s
      [
        hours.to_s.rjust(2, '0'),
        minutes.to_s.rjust(2, '0'),
        seconds.to_s.rjust(2, '0'),
      ].join(':')
    end

    def to_i
      @seconds
    end

    def ==(other)
      self.to_i == other.to_i
    end

    def coerce(other)
      [Split.new(other.to_i), self]
    end

    def +(other)
      Split.new(@seconds + other.to_i)
    end

    def -(other)
      Split.new(@seconds - other.to_i)
    end

    def /(other)
      Split.new(@seconds / other.to_i)
    end

    def *(other)
      Split.new(@seconds * other.to_i)
    end

    private

    def calculate_parts
      return @parts_cache if @parts_cache
      m, s = @seconds.divmod(SECS)
      h, m = m.divmod(SECS)
      @parts_cache = [h,m,s]
    end

  end
end
