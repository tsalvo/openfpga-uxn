-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 46
entity datetime_dei_0CLK_24541ec2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end datetime_dei_0CLK_24541ec2;
architecture arch of datetime_dei_0CLK_24541ec2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : device_in_result_t := (
device_ram_address => to_unsigned(0, 8),
dei_value => to_unsigned(0, 8),
is_dei_done => to_unsigned(0, 1))
;
signal device_port : unsigned(3 downto 0) := to_unsigned(0, 4);
signal REG_COMB_result : device_in_result_t;
signal REG_COMB_device_port : unsigned(3 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l502_c6_7b00]
signal BIN_OP_EQ_uxn_device_h_l502_c6_7b00_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l502_c6_7b00_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l502_c6_7b00_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l507_c7_9418]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l502_c2_29b7]
signal result_MUX_uxn_device_h_l502_c2_29b7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l502_c2_29b7_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l502_c2_29b7_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l502_c2_29b7_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l507_c11_a7ff]
signal BIN_OP_EQ_uxn_device_h_l507_c11_a7ff_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l507_c11_a7ff_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l507_c11_a7ff_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l512_c7_3270]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l507_c7_9418]
signal result_MUX_uxn_device_h_l507_c7_9418_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l507_c7_9418_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l507_c7_9418_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l507_c7_9418_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l512_c11_4544]
signal BIN_OP_EQ_uxn_device_h_l512_c11_4544_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l512_c11_4544_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l512_c11_4544_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l517_c7_0b45]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l512_c7_3270]
signal result_MUX_uxn_device_h_l512_c7_3270_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l512_c7_3270_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l512_c7_3270_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l512_c7_3270_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l517_c11_1406]
signal BIN_OP_EQ_uxn_device_h_l517_c11_1406_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l517_c11_1406_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l517_c11_1406_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l522_c7_c3e7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l517_c7_0b45]
signal result_MUX_uxn_device_h_l517_c7_0b45_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l517_c7_0b45_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l517_c7_0b45_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l517_c7_0b45_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l522_c11_384f]
signal BIN_OP_EQ_uxn_device_h_l522_c11_384f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l522_c11_384f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l522_c11_384f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l527_c7_f40d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l522_c7_c3e7]
signal result_MUX_uxn_device_h_l522_c7_c3e7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l522_c7_c3e7_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l522_c7_c3e7_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l522_c7_c3e7_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l527_c11_9804]
signal BIN_OP_EQ_uxn_device_h_l527_c11_9804_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l527_c11_9804_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l527_c11_9804_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l532_c7_a9ec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l527_c7_f40d]
signal result_MUX_uxn_device_h_l527_c7_f40d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l527_c7_f40d_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l527_c7_f40d_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l527_c7_f40d_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l532_c11_4e02]
signal BIN_OP_EQ_uxn_device_h_l532_c11_4e02_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l532_c11_4e02_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l532_c11_4e02_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l537_c7_6684]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l532_c7_a9ec]
signal result_MUX_uxn_device_h_l532_c7_a9ec_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l532_c7_a9ec_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l532_c7_a9ec_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l532_c7_a9ec_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l537_c11_5171]
signal BIN_OP_EQ_uxn_device_h_l537_c11_5171_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l537_c11_5171_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l537_c11_5171_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l542_c7_bc1a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l537_c7_6684]
signal result_MUX_uxn_device_h_l537_c7_6684_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l537_c7_6684_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l537_c7_6684_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l537_c7_6684_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l542_c11_99b3]
signal BIN_OP_EQ_uxn_device_h_l542_c11_99b3_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l542_c11_99b3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l542_c11_99b3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l547_c7_35e8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l542_c7_bc1a]
signal result_MUX_uxn_device_h_l542_c7_bc1a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l542_c7_bc1a_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l542_c7_bc1a_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l542_c7_bc1a_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l547_c11_f58d]
signal BIN_OP_EQ_uxn_device_h_l547_c11_f58d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l547_c11_f58d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l547_c11_f58d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l552_c7_5959]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l547_c7_35e8]
signal result_MUX_uxn_device_h_l547_c7_35e8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l547_c7_35e8_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l547_c7_35e8_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l547_c7_35e8_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l552_c11_3334]
signal BIN_OP_EQ_uxn_device_h_l552_c11_3334_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l552_c11_3334_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l552_c11_3334_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l557_c1_8b69]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l552_c7_5959]
signal result_MUX_uxn_device_h_l552_c7_5959_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l552_c7_5959_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l552_c7_5959_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l552_c7_5959_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l558_c12_0f7e]
signal generic_dei_uxn_device_h_l558_c12_0f7e_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l558_c12_0f7e_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l558_c12_0f7e_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l558_c12_0f7e_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l558_c12_0f7e_return_output : device_in_result_t;

function CAST_TO_uint4_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function CONST_REF_RD_device_in_result_t_device_in_result_t_5662( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return device_in_result_t is
 
  variable base : device_in_result_t; 
  variable return_output : device_in_result_t;
begin
      base.device_ram_address := ref_toks_0;
      base.dei_value := ref_toks_1;
      base.is_dei_done := ref_toks_2;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l502_c6_7b00
BIN_OP_EQ_uxn_device_h_l502_c6_7b00 : entity work.BIN_OP_EQ_uint4_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l502_c6_7b00_left,
BIN_OP_EQ_uxn_device_h_l502_c6_7b00_right,
BIN_OP_EQ_uxn_device_h_l502_c6_7b00_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_return_output);

-- result_MUX_uxn_device_h_l502_c2_29b7
result_MUX_uxn_device_h_l502_c2_29b7 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l502_c2_29b7_cond,
result_MUX_uxn_device_h_l502_c2_29b7_iftrue,
result_MUX_uxn_device_h_l502_c2_29b7_iffalse,
result_MUX_uxn_device_h_l502_c2_29b7_return_output);

-- BIN_OP_EQ_uxn_device_h_l507_c11_a7ff
BIN_OP_EQ_uxn_device_h_l507_c11_a7ff : entity work.BIN_OP_EQ_uint4_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l507_c11_a7ff_left,
BIN_OP_EQ_uxn_device_h_l507_c11_a7ff_right,
BIN_OP_EQ_uxn_device_h_l507_c11_a7ff_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_return_output);

-- result_MUX_uxn_device_h_l507_c7_9418
result_MUX_uxn_device_h_l507_c7_9418 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l507_c7_9418_cond,
result_MUX_uxn_device_h_l507_c7_9418_iftrue,
result_MUX_uxn_device_h_l507_c7_9418_iffalse,
result_MUX_uxn_device_h_l507_c7_9418_return_output);

-- BIN_OP_EQ_uxn_device_h_l512_c11_4544
BIN_OP_EQ_uxn_device_h_l512_c11_4544 : entity work.BIN_OP_EQ_uint4_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l512_c11_4544_left,
BIN_OP_EQ_uxn_device_h_l512_c11_4544_right,
BIN_OP_EQ_uxn_device_h_l512_c11_4544_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_return_output);

-- result_MUX_uxn_device_h_l512_c7_3270
result_MUX_uxn_device_h_l512_c7_3270 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l512_c7_3270_cond,
result_MUX_uxn_device_h_l512_c7_3270_iftrue,
result_MUX_uxn_device_h_l512_c7_3270_iffalse,
result_MUX_uxn_device_h_l512_c7_3270_return_output);

-- BIN_OP_EQ_uxn_device_h_l517_c11_1406
BIN_OP_EQ_uxn_device_h_l517_c11_1406 : entity work.BIN_OP_EQ_uint4_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l517_c11_1406_left,
BIN_OP_EQ_uxn_device_h_l517_c11_1406_right,
BIN_OP_EQ_uxn_device_h_l517_c11_1406_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_return_output);

-- result_MUX_uxn_device_h_l517_c7_0b45
result_MUX_uxn_device_h_l517_c7_0b45 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l517_c7_0b45_cond,
result_MUX_uxn_device_h_l517_c7_0b45_iftrue,
result_MUX_uxn_device_h_l517_c7_0b45_iffalse,
result_MUX_uxn_device_h_l517_c7_0b45_return_output);

-- BIN_OP_EQ_uxn_device_h_l522_c11_384f
BIN_OP_EQ_uxn_device_h_l522_c11_384f : entity work.BIN_OP_EQ_uint4_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l522_c11_384f_left,
BIN_OP_EQ_uxn_device_h_l522_c11_384f_right,
BIN_OP_EQ_uxn_device_h_l522_c11_384f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_return_output);

-- result_MUX_uxn_device_h_l522_c7_c3e7
result_MUX_uxn_device_h_l522_c7_c3e7 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l522_c7_c3e7_cond,
result_MUX_uxn_device_h_l522_c7_c3e7_iftrue,
result_MUX_uxn_device_h_l522_c7_c3e7_iffalse,
result_MUX_uxn_device_h_l522_c7_c3e7_return_output);

-- BIN_OP_EQ_uxn_device_h_l527_c11_9804
BIN_OP_EQ_uxn_device_h_l527_c11_9804 : entity work.BIN_OP_EQ_uint4_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l527_c11_9804_left,
BIN_OP_EQ_uxn_device_h_l527_c11_9804_right,
BIN_OP_EQ_uxn_device_h_l527_c11_9804_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_return_output);

-- result_MUX_uxn_device_h_l527_c7_f40d
result_MUX_uxn_device_h_l527_c7_f40d : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l527_c7_f40d_cond,
result_MUX_uxn_device_h_l527_c7_f40d_iftrue,
result_MUX_uxn_device_h_l527_c7_f40d_iffalse,
result_MUX_uxn_device_h_l527_c7_f40d_return_output);

-- BIN_OP_EQ_uxn_device_h_l532_c11_4e02
BIN_OP_EQ_uxn_device_h_l532_c11_4e02 : entity work.BIN_OP_EQ_uint4_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l532_c11_4e02_left,
BIN_OP_EQ_uxn_device_h_l532_c11_4e02_right,
BIN_OP_EQ_uxn_device_h_l532_c11_4e02_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_return_output);

-- result_MUX_uxn_device_h_l532_c7_a9ec
result_MUX_uxn_device_h_l532_c7_a9ec : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l532_c7_a9ec_cond,
result_MUX_uxn_device_h_l532_c7_a9ec_iftrue,
result_MUX_uxn_device_h_l532_c7_a9ec_iffalse,
result_MUX_uxn_device_h_l532_c7_a9ec_return_output);

-- BIN_OP_EQ_uxn_device_h_l537_c11_5171
BIN_OP_EQ_uxn_device_h_l537_c11_5171 : entity work.BIN_OP_EQ_uint4_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l537_c11_5171_left,
BIN_OP_EQ_uxn_device_h_l537_c11_5171_right,
BIN_OP_EQ_uxn_device_h_l537_c11_5171_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_return_output);

-- result_MUX_uxn_device_h_l537_c7_6684
result_MUX_uxn_device_h_l537_c7_6684 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l537_c7_6684_cond,
result_MUX_uxn_device_h_l537_c7_6684_iftrue,
result_MUX_uxn_device_h_l537_c7_6684_iffalse,
result_MUX_uxn_device_h_l537_c7_6684_return_output);

-- BIN_OP_EQ_uxn_device_h_l542_c11_99b3
BIN_OP_EQ_uxn_device_h_l542_c11_99b3 : entity work.BIN_OP_EQ_uint4_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l542_c11_99b3_left,
BIN_OP_EQ_uxn_device_h_l542_c11_99b3_right,
BIN_OP_EQ_uxn_device_h_l542_c11_99b3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_return_output);

-- result_MUX_uxn_device_h_l542_c7_bc1a
result_MUX_uxn_device_h_l542_c7_bc1a : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l542_c7_bc1a_cond,
result_MUX_uxn_device_h_l542_c7_bc1a_iftrue,
result_MUX_uxn_device_h_l542_c7_bc1a_iffalse,
result_MUX_uxn_device_h_l542_c7_bc1a_return_output);

-- BIN_OP_EQ_uxn_device_h_l547_c11_f58d
BIN_OP_EQ_uxn_device_h_l547_c11_f58d : entity work.BIN_OP_EQ_uint4_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l547_c11_f58d_left,
BIN_OP_EQ_uxn_device_h_l547_c11_f58d_right,
BIN_OP_EQ_uxn_device_h_l547_c11_f58d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_return_output);

-- result_MUX_uxn_device_h_l547_c7_35e8
result_MUX_uxn_device_h_l547_c7_35e8 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l547_c7_35e8_cond,
result_MUX_uxn_device_h_l547_c7_35e8_iftrue,
result_MUX_uxn_device_h_l547_c7_35e8_iffalse,
result_MUX_uxn_device_h_l547_c7_35e8_return_output);

-- BIN_OP_EQ_uxn_device_h_l552_c11_3334
BIN_OP_EQ_uxn_device_h_l552_c11_3334 : entity work.BIN_OP_EQ_uint4_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l552_c11_3334_left,
BIN_OP_EQ_uxn_device_h_l552_c11_3334_right,
BIN_OP_EQ_uxn_device_h_l552_c11_3334_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_return_output);

-- result_MUX_uxn_device_h_l552_c7_5959
result_MUX_uxn_device_h_l552_c7_5959 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l552_c7_5959_cond,
result_MUX_uxn_device_h_l552_c7_5959_iftrue,
result_MUX_uxn_device_h_l552_c7_5959_iffalse,
result_MUX_uxn_device_h_l552_c7_5959_return_output);

-- generic_dei_uxn_device_h_l558_c12_0f7e
generic_dei_uxn_device_h_l558_c12_0f7e : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l558_c12_0f7e_CLOCK_ENABLE,
generic_dei_uxn_device_h_l558_c12_0f7e_device_address,
generic_dei_uxn_device_h_l558_c12_0f7e_phase,
generic_dei_uxn_device_h_l558_c12_0f7e_previous_device_ram_read,
generic_dei_uxn_device_h_l558_c12_0f7e_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 phase,
 previous_device_ram_read,
 -- Registers
 result,
 device_port,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l502_c6_7b00_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_return_output,
 result_MUX_uxn_device_h_l502_c2_29b7_return_output,
 BIN_OP_EQ_uxn_device_h_l507_c11_a7ff_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_return_output,
 result_MUX_uxn_device_h_l507_c7_9418_return_output,
 BIN_OP_EQ_uxn_device_h_l512_c11_4544_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_return_output,
 result_MUX_uxn_device_h_l512_c7_3270_return_output,
 BIN_OP_EQ_uxn_device_h_l517_c11_1406_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_return_output,
 result_MUX_uxn_device_h_l517_c7_0b45_return_output,
 BIN_OP_EQ_uxn_device_h_l522_c11_384f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_return_output,
 result_MUX_uxn_device_h_l522_c7_c3e7_return_output,
 BIN_OP_EQ_uxn_device_h_l527_c11_9804_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_return_output,
 result_MUX_uxn_device_h_l527_c7_f40d_return_output,
 BIN_OP_EQ_uxn_device_h_l532_c11_4e02_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_return_output,
 result_MUX_uxn_device_h_l532_c7_a9ec_return_output,
 BIN_OP_EQ_uxn_device_h_l537_c11_5171_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_return_output,
 result_MUX_uxn_device_h_l537_c7_6684_return_output,
 BIN_OP_EQ_uxn_device_h_l542_c11_99b3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_return_output,
 result_MUX_uxn_device_h_l542_c7_bc1a_return_output,
 BIN_OP_EQ_uxn_device_h_l547_c11_f58d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_return_output,
 result_MUX_uxn_device_h_l547_c7_35e8_return_output,
 BIN_OP_EQ_uxn_device_h_l552_c11_3334_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_return_output,
 result_MUX_uxn_device_h_l552_c7_5959_return_output,
 generic_dei_uxn_device_h_l558_c12_0f7e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l499_c16_a055_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l502_c6_7b00_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l502_c6_7b00_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l502_c6_7b00_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l502_c2_29b7_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l502_c2_29b7_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l502_c2_29b7_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l507_c7_9418_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l502_c2_29b7_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l502_c2_29b7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l503_c3_d166 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l507_c11_a7ff_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l507_c11_a7ff_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l507_c11_a7ff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l507_c7_9418_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l507_c7_9418_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l507_c7_9418_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l512_c7_3270_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l507_c7_9418_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l508_c3_a70b : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l512_c11_4544_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l512_c11_4544_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l512_c11_4544_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l512_c7_3270_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l512_c7_3270_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l512_c7_3270_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l517_c7_0b45_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l512_c7_3270_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l513_c3_41c1 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l517_c11_1406_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l517_c11_1406_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l517_c11_1406_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l517_c7_0b45_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l517_c7_0b45_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l517_c7_0b45_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l522_c7_c3e7_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l517_c7_0b45_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l518_c3_b189 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l522_c11_384f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l522_c11_384f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l522_c11_384f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l522_c7_c3e7_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l522_c7_c3e7_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l522_c7_c3e7_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l527_c7_f40d_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l522_c7_c3e7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l523_c3_d345 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l527_c11_9804_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l527_c11_9804_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l527_c11_9804_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l527_c7_f40d_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l527_c7_f40d_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l527_c7_f40d_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l532_c7_a9ec_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l527_c7_f40d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l528_c3_ea33 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l532_c11_4e02_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l532_c11_4e02_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l532_c11_4e02_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l532_c7_a9ec_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l532_c7_a9ec_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l532_c7_a9ec_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l537_c7_6684_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l532_c7_a9ec_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l533_c3_5375 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l537_c11_5171_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l537_c11_5171_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l537_c11_5171_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l537_c7_6684_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l537_c7_6684_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l537_c7_6684_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l542_c7_bc1a_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l537_c7_6684_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l538_c3_5a05 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l542_c11_99b3_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l542_c11_99b3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l542_c11_99b3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l542_c7_bc1a_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l542_c7_bc1a_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l542_c7_bc1a_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l547_c7_35e8_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l542_c7_bc1a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l543_c3_f4d2 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l547_c11_f58d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l547_c11_f58d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l547_c11_f58d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l547_c7_35e8_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l547_c7_35e8_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l547_c7_35e8_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l552_c7_5959_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l547_c7_35e8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l548_c3_e833 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l552_c11_3334_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l552_c11_3334_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l552_c11_3334_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l552_c7_5959_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l552_c7_5959_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l552_c7_5959_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l552_c7_5959_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l553_c3_7bd5 : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l558_c12_0f7e_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l558_c12_0f7e_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l558_c12_0f7e_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l558_c12_0f7e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l558_c12_0f7e_return_output : device_in_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : device_in_result_t;
variable REG_VAR_device_port : unsigned(3 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
  REG_VAR_device_port := device_port;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_device_h_l522_c11_384f_right := to_unsigned(4, 8);
     VAR_result_device_ram_address_uxn_device_h_l533_c3_5375 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l513_c3_41c1 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l502_c6_7b00_right := to_unsigned(0, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l528_c3_ea33 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l517_c11_1406_right := to_unsigned(3, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l537_c11_5171_right := to_unsigned(7, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l538_c3_5a05 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l548_c3_e833 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l518_c3_b189 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l543_c3_f4d2 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l523_c3_d345 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l527_c11_9804_right := to_unsigned(5, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l507_c11_a7ff_right := to_unsigned(1, 8);
     VAR_result_device_ram_address_uxn_device_h_l553_c3_7bd5 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l552_c11_3334_right := to_unsigned(10, 8);
     VAR_result_device_ram_address_uxn_device_h_l503_c3_d166 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l512_c11_4544_right := to_unsigned(2, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l542_c11_99b3_right := to_unsigned(8, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l547_c11_f58d_right := to_unsigned(9, 8);
     VAR_result_device_ram_address_uxn_device_h_l508_c3_a70b := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l532_c11_4e02_right := to_unsigned(6, 8);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l512_c7_3270] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l512_c7_3270_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l513_c3_41c1,
     to_unsigned(11, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l542_c7_bc1a] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l542_c7_bc1a_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l543_c3_f4d2,
     to_unsigned(1, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l537_c7_6684] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l537_c7_6684_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l538_c3_5a05,
     to_unsigned(5, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l507_c7_9418] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l507_c7_9418_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l508_c3_a70b,
     to_unsigned(190, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l522_c7_c3e7] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l522_c7_c3e7_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l523_c3_d345,
     to_unsigned(6, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l502_c2_29b7] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l502_c2_29b7_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l503_c3_d166,
     to_unsigned(7, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l527_c7_f40d] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l527_c7_f40d_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l528_c3_ea33,
     to_unsigned(51, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l547_c7_35e8] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l547_c7_35e8_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l548_c3_e833,
     to_unsigned(108, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l517_c7_0b45] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l517_c7_0b45_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l518_c3_b189,
     to_unsigned(30, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l552_c7_5959] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l552_c7_5959_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l553_c3_7bd5,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l532_c7_a9ec] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l532_c7_a9ec_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l533_c3_5375,
     to_unsigned(4, 8),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l507_c7_9418_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l507_c7_9418_return_output;
     VAR_result_MUX_uxn_device_h_l517_c7_0b45_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l517_c7_0b45_return_output;
     VAR_result_MUX_uxn_device_h_l522_c7_c3e7_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l522_c7_c3e7_return_output;
     VAR_result_MUX_uxn_device_h_l502_c2_29b7_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l502_c2_29b7_return_output;
     VAR_result_MUX_uxn_device_h_l542_c7_bc1a_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l542_c7_bc1a_return_output;
     VAR_result_MUX_uxn_device_h_l527_c7_f40d_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l527_c7_f40d_return_output;
     VAR_result_MUX_uxn_device_h_l547_c7_35e8_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l547_c7_35e8_return_output;
     VAR_result_MUX_uxn_device_h_l532_c7_a9ec_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l532_c7_a9ec_return_output;
     VAR_result_MUX_uxn_device_h_l512_c7_3270_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l512_c7_3270_return_output;
     VAR_result_MUX_uxn_device_h_l537_c7_6684_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l537_c7_6684_return_output;
     VAR_result_MUX_uxn_device_h_l552_c7_5959_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l552_c7_5959_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_address := device_address;
     VAR_phase := phase;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_iffalse := VAR_CLOCK_ENABLE;
     VAR_generic_dei_uxn_device_h_l558_c12_0f7e_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l558_c12_0f7e_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l558_c12_0f7e_previous_device_ram_read := VAR_previous_device_ram_read;
     -- CAST_TO_uint4_t[uxn_device_h_l499_c16_a055] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l499_c16_a055_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_address);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l502_c6_7b00_left := VAR_CAST_TO_uint4_t_uxn_device_h_l499_c16_a055_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l507_c11_a7ff_left := VAR_CAST_TO_uint4_t_uxn_device_h_l499_c16_a055_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l512_c11_4544_left := VAR_CAST_TO_uint4_t_uxn_device_h_l499_c16_a055_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l517_c11_1406_left := VAR_CAST_TO_uint4_t_uxn_device_h_l499_c16_a055_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l522_c11_384f_left := VAR_CAST_TO_uint4_t_uxn_device_h_l499_c16_a055_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l527_c11_9804_left := VAR_CAST_TO_uint4_t_uxn_device_h_l499_c16_a055_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l532_c11_4e02_left := VAR_CAST_TO_uint4_t_uxn_device_h_l499_c16_a055_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l537_c11_5171_left := VAR_CAST_TO_uint4_t_uxn_device_h_l499_c16_a055_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l542_c11_99b3_left := VAR_CAST_TO_uint4_t_uxn_device_h_l499_c16_a055_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l547_c11_f58d_left := VAR_CAST_TO_uint4_t_uxn_device_h_l499_c16_a055_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l552_c11_3334_left := VAR_CAST_TO_uint4_t_uxn_device_h_l499_c16_a055_return_output;
     REG_VAR_device_port := VAR_CAST_TO_uint4_t_uxn_device_h_l499_c16_a055_return_output;
     -- BIN_OP_EQ[uxn_device_h_l517_c11_1406] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l517_c11_1406_left <= VAR_BIN_OP_EQ_uxn_device_h_l517_c11_1406_left;
     BIN_OP_EQ_uxn_device_h_l517_c11_1406_right <= VAR_BIN_OP_EQ_uxn_device_h_l517_c11_1406_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l517_c11_1406_return_output := BIN_OP_EQ_uxn_device_h_l517_c11_1406_return_output;

     -- BIN_OP_EQ[uxn_device_h_l532_c11_4e02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l532_c11_4e02_left <= VAR_BIN_OP_EQ_uxn_device_h_l532_c11_4e02_left;
     BIN_OP_EQ_uxn_device_h_l532_c11_4e02_right <= VAR_BIN_OP_EQ_uxn_device_h_l532_c11_4e02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l532_c11_4e02_return_output := BIN_OP_EQ_uxn_device_h_l532_c11_4e02_return_output;

     -- BIN_OP_EQ[uxn_device_h_l522_c11_384f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l522_c11_384f_left <= VAR_BIN_OP_EQ_uxn_device_h_l522_c11_384f_left;
     BIN_OP_EQ_uxn_device_h_l522_c11_384f_right <= VAR_BIN_OP_EQ_uxn_device_h_l522_c11_384f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l522_c11_384f_return_output := BIN_OP_EQ_uxn_device_h_l522_c11_384f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l552_c11_3334] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l552_c11_3334_left <= VAR_BIN_OP_EQ_uxn_device_h_l552_c11_3334_left;
     BIN_OP_EQ_uxn_device_h_l552_c11_3334_right <= VAR_BIN_OP_EQ_uxn_device_h_l552_c11_3334_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l552_c11_3334_return_output := BIN_OP_EQ_uxn_device_h_l552_c11_3334_return_output;

     -- BIN_OP_EQ[uxn_device_h_l537_c11_5171] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l537_c11_5171_left <= VAR_BIN_OP_EQ_uxn_device_h_l537_c11_5171_left;
     BIN_OP_EQ_uxn_device_h_l537_c11_5171_right <= VAR_BIN_OP_EQ_uxn_device_h_l537_c11_5171_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l537_c11_5171_return_output := BIN_OP_EQ_uxn_device_h_l537_c11_5171_return_output;

     -- BIN_OP_EQ[uxn_device_h_l502_c6_7b00] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l502_c6_7b00_left <= VAR_BIN_OP_EQ_uxn_device_h_l502_c6_7b00_left;
     BIN_OP_EQ_uxn_device_h_l502_c6_7b00_right <= VAR_BIN_OP_EQ_uxn_device_h_l502_c6_7b00_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l502_c6_7b00_return_output := BIN_OP_EQ_uxn_device_h_l502_c6_7b00_return_output;

     -- BIN_OP_EQ[uxn_device_h_l512_c11_4544] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l512_c11_4544_left <= VAR_BIN_OP_EQ_uxn_device_h_l512_c11_4544_left;
     BIN_OP_EQ_uxn_device_h_l512_c11_4544_right <= VAR_BIN_OP_EQ_uxn_device_h_l512_c11_4544_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l512_c11_4544_return_output := BIN_OP_EQ_uxn_device_h_l512_c11_4544_return_output;

     -- BIN_OP_EQ[uxn_device_h_l527_c11_9804] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l527_c11_9804_left <= VAR_BIN_OP_EQ_uxn_device_h_l527_c11_9804_left;
     BIN_OP_EQ_uxn_device_h_l527_c11_9804_right <= VAR_BIN_OP_EQ_uxn_device_h_l527_c11_9804_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l527_c11_9804_return_output := BIN_OP_EQ_uxn_device_h_l527_c11_9804_return_output;

     -- BIN_OP_EQ[uxn_device_h_l507_c11_a7ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l507_c11_a7ff_left <= VAR_BIN_OP_EQ_uxn_device_h_l507_c11_a7ff_left;
     BIN_OP_EQ_uxn_device_h_l507_c11_a7ff_right <= VAR_BIN_OP_EQ_uxn_device_h_l507_c11_a7ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l507_c11_a7ff_return_output := BIN_OP_EQ_uxn_device_h_l507_c11_a7ff_return_output;

     -- BIN_OP_EQ[uxn_device_h_l547_c11_f58d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l547_c11_f58d_left <= VAR_BIN_OP_EQ_uxn_device_h_l547_c11_f58d_left;
     BIN_OP_EQ_uxn_device_h_l547_c11_f58d_right <= VAR_BIN_OP_EQ_uxn_device_h_l547_c11_f58d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l547_c11_f58d_return_output := BIN_OP_EQ_uxn_device_h_l547_c11_f58d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l542_c11_99b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l542_c11_99b3_left <= VAR_BIN_OP_EQ_uxn_device_h_l542_c11_99b3_left;
     BIN_OP_EQ_uxn_device_h_l542_c11_99b3_right <= VAR_BIN_OP_EQ_uxn_device_h_l542_c11_99b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l542_c11_99b3_return_output := BIN_OP_EQ_uxn_device_h_l542_c11_99b3_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_cond := VAR_BIN_OP_EQ_uxn_device_h_l502_c6_7b00_return_output;
     VAR_result_MUX_uxn_device_h_l502_c2_29b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l502_c6_7b00_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_cond := VAR_BIN_OP_EQ_uxn_device_h_l507_c11_a7ff_return_output;
     VAR_result_MUX_uxn_device_h_l507_c7_9418_cond := VAR_BIN_OP_EQ_uxn_device_h_l507_c11_a7ff_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_cond := VAR_BIN_OP_EQ_uxn_device_h_l512_c11_4544_return_output;
     VAR_result_MUX_uxn_device_h_l512_c7_3270_cond := VAR_BIN_OP_EQ_uxn_device_h_l512_c11_4544_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_cond := VAR_BIN_OP_EQ_uxn_device_h_l517_c11_1406_return_output;
     VAR_result_MUX_uxn_device_h_l517_c7_0b45_cond := VAR_BIN_OP_EQ_uxn_device_h_l517_c11_1406_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_cond := VAR_BIN_OP_EQ_uxn_device_h_l522_c11_384f_return_output;
     VAR_result_MUX_uxn_device_h_l522_c7_c3e7_cond := VAR_BIN_OP_EQ_uxn_device_h_l522_c11_384f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_cond := VAR_BIN_OP_EQ_uxn_device_h_l527_c11_9804_return_output;
     VAR_result_MUX_uxn_device_h_l527_c7_f40d_cond := VAR_BIN_OP_EQ_uxn_device_h_l527_c11_9804_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_cond := VAR_BIN_OP_EQ_uxn_device_h_l532_c11_4e02_return_output;
     VAR_result_MUX_uxn_device_h_l532_c7_a9ec_cond := VAR_BIN_OP_EQ_uxn_device_h_l532_c11_4e02_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l537_c11_5171_return_output;
     VAR_result_MUX_uxn_device_h_l537_c7_6684_cond := VAR_BIN_OP_EQ_uxn_device_h_l537_c11_5171_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l542_c11_99b3_return_output;
     VAR_result_MUX_uxn_device_h_l542_c7_bc1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l542_c11_99b3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_cond := VAR_BIN_OP_EQ_uxn_device_h_l547_c11_f58d_return_output;
     VAR_result_MUX_uxn_device_h_l547_c7_35e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l547_c11_f58d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_cond := VAR_BIN_OP_EQ_uxn_device_h_l552_c11_3334_return_output;
     VAR_result_MUX_uxn_device_h_l552_c7_5959_cond := VAR_BIN_OP_EQ_uxn_device_h_l552_c11_3334_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l507_c7_9418] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l507_c7_9418_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l512_c7_3270] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l512_c7_3270_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l517_c7_0b45] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l517_c7_0b45_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l522_c7_c3e7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l522_c7_c3e7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l527_c7_f40d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l527_c7_f40d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l532_c7_a9ec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l532_c7_a9ec_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l537_c7_6684] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l537_c7_6684_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l542_c7_bc1a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l542_c7_bc1a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l547_c7_35e8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l547_c7_35e8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l552_c7_5959] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l552_c7_5959_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l557_c1_8b69] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_return_output;

     -- Submodule level 13
     VAR_generic_dei_uxn_device_h_l558_c12_0f7e_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l557_c1_8b69_return_output;
     -- generic_dei[uxn_device_h_l558_c12_0f7e] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l558_c12_0f7e_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l558_c12_0f7e_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l558_c12_0f7e_device_address <= VAR_generic_dei_uxn_device_h_l558_c12_0f7e_device_address;
     generic_dei_uxn_device_h_l558_c12_0f7e_phase <= VAR_generic_dei_uxn_device_h_l558_c12_0f7e_phase;
     generic_dei_uxn_device_h_l558_c12_0f7e_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l558_c12_0f7e_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l558_c12_0f7e_return_output := generic_dei_uxn_device_h_l558_c12_0f7e_return_output;

     -- Submodule level 14
     VAR_result_MUX_uxn_device_h_l552_c7_5959_iffalse := VAR_generic_dei_uxn_device_h_l558_c12_0f7e_return_output;
     -- result_MUX[uxn_device_h_l552_c7_5959] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l552_c7_5959_cond <= VAR_result_MUX_uxn_device_h_l552_c7_5959_cond;
     result_MUX_uxn_device_h_l552_c7_5959_iftrue <= VAR_result_MUX_uxn_device_h_l552_c7_5959_iftrue;
     result_MUX_uxn_device_h_l552_c7_5959_iffalse <= VAR_result_MUX_uxn_device_h_l552_c7_5959_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l552_c7_5959_return_output := result_MUX_uxn_device_h_l552_c7_5959_return_output;

     -- Submodule level 15
     VAR_result_MUX_uxn_device_h_l547_c7_35e8_iffalse := VAR_result_MUX_uxn_device_h_l552_c7_5959_return_output;
     -- result_MUX[uxn_device_h_l547_c7_35e8] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l547_c7_35e8_cond <= VAR_result_MUX_uxn_device_h_l547_c7_35e8_cond;
     result_MUX_uxn_device_h_l547_c7_35e8_iftrue <= VAR_result_MUX_uxn_device_h_l547_c7_35e8_iftrue;
     result_MUX_uxn_device_h_l547_c7_35e8_iffalse <= VAR_result_MUX_uxn_device_h_l547_c7_35e8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l547_c7_35e8_return_output := result_MUX_uxn_device_h_l547_c7_35e8_return_output;

     -- Submodule level 16
     VAR_result_MUX_uxn_device_h_l542_c7_bc1a_iffalse := VAR_result_MUX_uxn_device_h_l547_c7_35e8_return_output;
     -- result_MUX[uxn_device_h_l542_c7_bc1a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l542_c7_bc1a_cond <= VAR_result_MUX_uxn_device_h_l542_c7_bc1a_cond;
     result_MUX_uxn_device_h_l542_c7_bc1a_iftrue <= VAR_result_MUX_uxn_device_h_l542_c7_bc1a_iftrue;
     result_MUX_uxn_device_h_l542_c7_bc1a_iffalse <= VAR_result_MUX_uxn_device_h_l542_c7_bc1a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l542_c7_bc1a_return_output := result_MUX_uxn_device_h_l542_c7_bc1a_return_output;

     -- Submodule level 17
     VAR_result_MUX_uxn_device_h_l537_c7_6684_iffalse := VAR_result_MUX_uxn_device_h_l542_c7_bc1a_return_output;
     -- result_MUX[uxn_device_h_l537_c7_6684] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l537_c7_6684_cond <= VAR_result_MUX_uxn_device_h_l537_c7_6684_cond;
     result_MUX_uxn_device_h_l537_c7_6684_iftrue <= VAR_result_MUX_uxn_device_h_l537_c7_6684_iftrue;
     result_MUX_uxn_device_h_l537_c7_6684_iffalse <= VAR_result_MUX_uxn_device_h_l537_c7_6684_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l537_c7_6684_return_output := result_MUX_uxn_device_h_l537_c7_6684_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_device_h_l532_c7_a9ec_iffalse := VAR_result_MUX_uxn_device_h_l537_c7_6684_return_output;
     -- result_MUX[uxn_device_h_l532_c7_a9ec] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l532_c7_a9ec_cond <= VAR_result_MUX_uxn_device_h_l532_c7_a9ec_cond;
     result_MUX_uxn_device_h_l532_c7_a9ec_iftrue <= VAR_result_MUX_uxn_device_h_l532_c7_a9ec_iftrue;
     result_MUX_uxn_device_h_l532_c7_a9ec_iffalse <= VAR_result_MUX_uxn_device_h_l532_c7_a9ec_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l532_c7_a9ec_return_output := result_MUX_uxn_device_h_l532_c7_a9ec_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_device_h_l527_c7_f40d_iffalse := VAR_result_MUX_uxn_device_h_l532_c7_a9ec_return_output;
     -- result_MUX[uxn_device_h_l527_c7_f40d] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l527_c7_f40d_cond <= VAR_result_MUX_uxn_device_h_l527_c7_f40d_cond;
     result_MUX_uxn_device_h_l527_c7_f40d_iftrue <= VAR_result_MUX_uxn_device_h_l527_c7_f40d_iftrue;
     result_MUX_uxn_device_h_l527_c7_f40d_iffalse <= VAR_result_MUX_uxn_device_h_l527_c7_f40d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l527_c7_f40d_return_output := result_MUX_uxn_device_h_l527_c7_f40d_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_device_h_l522_c7_c3e7_iffalse := VAR_result_MUX_uxn_device_h_l527_c7_f40d_return_output;
     -- result_MUX[uxn_device_h_l522_c7_c3e7] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l522_c7_c3e7_cond <= VAR_result_MUX_uxn_device_h_l522_c7_c3e7_cond;
     result_MUX_uxn_device_h_l522_c7_c3e7_iftrue <= VAR_result_MUX_uxn_device_h_l522_c7_c3e7_iftrue;
     result_MUX_uxn_device_h_l522_c7_c3e7_iffalse <= VAR_result_MUX_uxn_device_h_l522_c7_c3e7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l522_c7_c3e7_return_output := result_MUX_uxn_device_h_l522_c7_c3e7_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_device_h_l517_c7_0b45_iffalse := VAR_result_MUX_uxn_device_h_l522_c7_c3e7_return_output;
     -- result_MUX[uxn_device_h_l517_c7_0b45] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l517_c7_0b45_cond <= VAR_result_MUX_uxn_device_h_l517_c7_0b45_cond;
     result_MUX_uxn_device_h_l517_c7_0b45_iftrue <= VAR_result_MUX_uxn_device_h_l517_c7_0b45_iftrue;
     result_MUX_uxn_device_h_l517_c7_0b45_iffalse <= VAR_result_MUX_uxn_device_h_l517_c7_0b45_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l517_c7_0b45_return_output := result_MUX_uxn_device_h_l517_c7_0b45_return_output;

     -- Submodule level 22
     VAR_result_MUX_uxn_device_h_l512_c7_3270_iffalse := VAR_result_MUX_uxn_device_h_l517_c7_0b45_return_output;
     -- result_MUX[uxn_device_h_l512_c7_3270] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l512_c7_3270_cond <= VAR_result_MUX_uxn_device_h_l512_c7_3270_cond;
     result_MUX_uxn_device_h_l512_c7_3270_iftrue <= VAR_result_MUX_uxn_device_h_l512_c7_3270_iftrue;
     result_MUX_uxn_device_h_l512_c7_3270_iffalse <= VAR_result_MUX_uxn_device_h_l512_c7_3270_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l512_c7_3270_return_output := result_MUX_uxn_device_h_l512_c7_3270_return_output;

     -- Submodule level 23
     VAR_result_MUX_uxn_device_h_l507_c7_9418_iffalse := VAR_result_MUX_uxn_device_h_l512_c7_3270_return_output;
     -- result_MUX[uxn_device_h_l507_c7_9418] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l507_c7_9418_cond <= VAR_result_MUX_uxn_device_h_l507_c7_9418_cond;
     result_MUX_uxn_device_h_l507_c7_9418_iftrue <= VAR_result_MUX_uxn_device_h_l507_c7_9418_iftrue;
     result_MUX_uxn_device_h_l507_c7_9418_iffalse <= VAR_result_MUX_uxn_device_h_l507_c7_9418_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l507_c7_9418_return_output := result_MUX_uxn_device_h_l507_c7_9418_return_output;

     -- Submodule level 24
     VAR_result_MUX_uxn_device_h_l502_c2_29b7_iffalse := VAR_result_MUX_uxn_device_h_l507_c7_9418_return_output;
     -- result_MUX[uxn_device_h_l502_c2_29b7] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l502_c2_29b7_cond <= VAR_result_MUX_uxn_device_h_l502_c2_29b7_cond;
     result_MUX_uxn_device_h_l502_c2_29b7_iftrue <= VAR_result_MUX_uxn_device_h_l502_c2_29b7_iftrue;
     result_MUX_uxn_device_h_l502_c2_29b7_iffalse <= VAR_result_MUX_uxn_device_h_l502_c2_29b7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l502_c2_29b7_return_output := result_MUX_uxn_device_h_l502_c2_29b7_return_output;

     -- Submodule level 25
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l502_c2_29b7_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l502_c2_29b7_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_port <= REG_VAR_device_port;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
     device_port <= REG_COMB_device_port;
 end if;
 end if;
end process;

end arch;
