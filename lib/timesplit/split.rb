module Timesplit
  class Split

    SECS = 60.0

    def self.[](*values)
      new(*values)
    end

    def initialize(*times)
      times = times.first.split(/[^\d]+/).map(&:to_f) if times.first.is_a? String
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
        hours.to_i.to_s.rjust(2, '0'),
        minutes.to_i.to_s.rjust(2, '0'),
        seconds.to_i.to_s.rjust(2, '0'),
      ].join(':')
    end

    def to_i
      @seconds.to_i
    end

    def to_f
      @seconds.to_f
    end

    def ==(other)
      self.to_f == other.to_f
    end

    def coerce(other)
      [Split.new(other.to_f), self]
    end

    def +(other)
      Split.new(@seconds + other.to_f)
    end

    def -(other)
      Split.new(@seconds - other.to_f)
    end

    def /(other)
      Split.new(@seconds / other.to_f)
    end

    def *(other)
      Split.new(@seconds * other.to_f)
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
