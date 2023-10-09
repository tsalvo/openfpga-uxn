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
-- Submodules: 15
entity stack_ram_update_0CLK_bdb363bb is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 address0 : in unsigned(7 downto 0);
 write0_value : in unsigned(7 downto 0);
 write0_enable : in unsigned(0 downto 0);
 read0_enable : in unsigned(0 downto 0);
 address1 : in unsigned(7 downto 0);
 read1_enable : in unsigned(0 downto 0);
 return_output : out unsigned(15 downto 0));
end stack_ram_update_0CLK_bdb363bb;
architecture arch of stack_ram_update_0CLK_bdb363bb is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal rdaddr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal rwaddr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal wdata : unsigned(7 downto 0) := to_unsigned(0, 8);
signal rdvalue0 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal rdvalue1 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(15 downto 0) := to_unsigned(0, 16);
signal stack_index_boost : unsigned(31 downto 0) := to_unsigned(0, 32);
signal REG_COMB_rdaddr : unsigned(31 downto 0);
signal REG_COMB_rwaddr : unsigned(31 downto 0);
signal REG_COMB_wdata : unsigned(7 downto 0);
signal REG_COMB_rdvalue0 : unsigned(7 downto 0);
signal REG_COMB_rdvalue1 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(15 downto 0);
signal REG_COMB_stack_index_boost : unsigned(31 downto 0);

-- Each function instance gets signals
-- MUX[uxn_stack_h_l35_c22_4e18]
signal MUX_uxn_stack_h_l35_c22_4e18_cond : unsigned(0 downto 0);
signal MUX_uxn_stack_h_l35_c22_4e18_iftrue : unsigned(31 downto 0);
signal MUX_uxn_stack_h_l35_c22_4e18_iffalse : unsigned(31 downto 0);
signal MUX_uxn_stack_h_l35_c22_4e18_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l36_c11_4fbe]
signal BIN_OP_PLUS_uxn_stack_h_l36_c11_4fbe_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l36_c11_4fbe_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l36_c11_4fbe_return_output : unsigned(32 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l37_c11_eb74]
signal BIN_OP_PLUS_uxn_stack_h_l37_c11_eb74_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l37_c11_eb74_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l37_c11_eb74_return_output : unsigned(32 downto 0);

-- stack_ram[uxn_stack_h_l43_c38_f420]
signal stack_ram_uxn_stack_h_l43_c38_f420_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_uxn_stack_h_l43_c38_f420_addr0 : unsigned(31 downto 0);
signal stack_ram_uxn_stack_h_l43_c38_f420_wr_data0 : unsigned(7 downto 0);
signal stack_ram_uxn_stack_h_l43_c38_f420_wr_en0 : unsigned(0 downto 0);
signal stack_ram_uxn_stack_h_l43_c38_f420_valid0 : unsigned(0 downto 0);
signal stack_ram_uxn_stack_h_l43_c38_f420_rd_en0 : unsigned(0 downto 0);
signal stack_ram_uxn_stack_h_l43_c38_f420_addr1 : unsigned(31 downto 0);
signal stack_ram_uxn_stack_h_l43_c38_f420_valid1 : unsigned(0 downto 0);
signal stack_ram_uxn_stack_h_l43_c38_f420_rd_en1 : unsigned(0 downto 0);
signal stack_ram_uxn_stack_h_l43_c38_f420_return_output : stack_ram_outputs_t;

-- BIN_OP_AND[uxn_stack_h_l54_c13_0cae]
signal BIN_OP_AND_uxn_stack_h_l54_c13_0cae_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_stack_h_l54_c13_0cae_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_stack_h_l54_c13_0cae_return_output : unsigned(0 downto 0);

-- MUX[uxn_stack_h_l54_c13_9dca]
signal MUX_uxn_stack_h_l54_c13_9dca_cond : unsigned(0 downto 0);
signal MUX_uxn_stack_h_l54_c13_9dca_iftrue : unsigned(7 downto 0);
signal MUX_uxn_stack_h_l54_c13_9dca_iffalse : unsigned(7 downto 0);
signal MUX_uxn_stack_h_l54_c13_9dca_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_stack_h_l55_c13_3819]
signal BIN_OP_AND_uxn_stack_h_l55_c13_3819_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_stack_h_l55_c13_3819_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_stack_h_l55_c13_3819_return_output : unsigned(0 downto 0);

-- MUX[uxn_stack_h_l55_c13_6372]
signal MUX_uxn_stack_h_l55_c13_6372_cond : unsigned(0 downto 0);
signal MUX_uxn_stack_h_l55_c13_6372_iftrue : unsigned(7 downto 0);
signal MUX_uxn_stack_h_l55_c13_6372_iffalse : unsigned(7 downto 0);
signal MUX_uxn_stack_h_l55_c13_6372_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_stack_h_l58_c2_4938]
signal CONST_SL_8_uxn_stack_h_l58_c2_4938_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_stack_h_l58_c2_4938_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_stack_h_l59_c2_3308]
signal BIN_OP_OR_uxn_stack_h_l59_c2_3308_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_stack_h_l59_c2_3308_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_stack_h_l59_c2_3308_return_output : unsigned(15 downto 0);

-- printf_uxn_stack_h_l61_c2_53ad[uxn_stack_h_l61_c2_53ad]
signal printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg0 : unsigned(31 downto 0);
signal printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg1 : unsigned(31 downto 0);
signal printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg2 : unsigned(31 downto 0);
signal printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg3 : unsigned(31 downto 0);
signal printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg4 : unsigned(31 downto 0);
signal printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg5 : unsigned(31 downto 0);
signal printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg6 : unsigned(31 downto 0);

function CAST_TO_uint32_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,32)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- MUX_uxn_stack_h_l35_c22_4e18
MUX_uxn_stack_h_l35_c22_4e18 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
MUX_uxn_stack_h_l35_c22_4e18_cond,
MUX_uxn_stack_h_l35_c22_4e18_iftrue,
MUX_uxn_stack_h_l35_c22_4e18_iffalse,
MUX_uxn_stack_h_l35_c22_4e18_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l36_c11_4fbe
BIN_OP_PLUS_uxn_stack_h_l36_c11_4fbe : entity work.BIN_OP_PLUS_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l36_c11_4fbe_left,
BIN_OP_PLUS_uxn_stack_h_l36_c11_4fbe_right,
BIN_OP_PLUS_uxn_stack_h_l36_c11_4fbe_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l37_c11_eb74
BIN_OP_PLUS_uxn_stack_h_l37_c11_eb74 : entity work.BIN_OP_PLUS_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l37_c11_eb74_left,
BIN_OP_PLUS_uxn_stack_h_l37_c11_eb74_right,
BIN_OP_PLUS_uxn_stack_h_l37_c11_eb74_return_output);

-- stack_ram_uxn_stack_h_l43_c38_f420
stack_ram_uxn_stack_h_l43_c38_f420 : entity work.stack_ram_0CLK_b45f1687 port map (
clk,
stack_ram_uxn_stack_h_l43_c38_f420_CLOCK_ENABLE,
stack_ram_uxn_stack_h_l43_c38_f420_addr0,
stack_ram_uxn_stack_h_l43_c38_f420_wr_data0,
stack_ram_uxn_stack_h_l43_c38_f420_wr_en0,
stack_ram_uxn_stack_h_l43_c38_f420_valid0,
stack_ram_uxn_stack_h_l43_c38_f420_rd_en0,
stack_ram_uxn_stack_h_l43_c38_f420_addr1,
stack_ram_uxn_stack_h_l43_c38_f420_valid1,
stack_ram_uxn_stack_h_l43_c38_f420_rd_en1,
stack_ram_uxn_stack_h_l43_c38_f420_return_output);

-- BIN_OP_AND_uxn_stack_h_l54_c13_0cae
BIN_OP_AND_uxn_stack_h_l54_c13_0cae : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_stack_h_l54_c13_0cae_left,
BIN_OP_AND_uxn_stack_h_l54_c13_0cae_right,
BIN_OP_AND_uxn_stack_h_l54_c13_0cae_return_output);

-- MUX_uxn_stack_h_l54_c13_9dca
MUX_uxn_stack_h_l54_c13_9dca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_stack_h_l54_c13_9dca_cond,
MUX_uxn_stack_h_l54_c13_9dca_iftrue,
MUX_uxn_stack_h_l54_c13_9dca_iffalse,
MUX_uxn_stack_h_l54_c13_9dca_return_output);

-- BIN_OP_AND_uxn_stack_h_l55_c13_3819
BIN_OP_AND_uxn_stack_h_l55_c13_3819 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_stack_h_l55_c13_3819_left,
BIN_OP_AND_uxn_stack_h_l55_c13_3819_right,
BIN_OP_AND_uxn_stack_h_l55_c13_3819_return_output);

-- MUX_uxn_stack_h_l55_c13_6372
MUX_uxn_stack_h_l55_c13_6372 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_stack_h_l55_c13_6372_cond,
MUX_uxn_stack_h_l55_c13_6372_iftrue,
MUX_uxn_stack_h_l55_c13_6372_iffalse,
MUX_uxn_stack_h_l55_c13_6372_return_output);

-- CONST_SL_8_uxn_stack_h_l58_c2_4938
CONST_SL_8_uxn_stack_h_l58_c2_4938 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_stack_h_l58_c2_4938_x,
CONST_SL_8_uxn_stack_h_l58_c2_4938_return_output);

-- BIN_OP_OR_uxn_stack_h_l59_c2_3308
BIN_OP_OR_uxn_stack_h_l59_c2_3308 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_stack_h_l59_c2_3308_left,
BIN_OP_OR_uxn_stack_h_l59_c2_3308_right,
BIN_OP_OR_uxn_stack_h_l59_c2_3308_return_output);

-- printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad
printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad : entity work.printf_uxn_stack_h_l61_c2_53ad_0CLK_de264c78 port map (
printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_CLOCK_ENABLE,
printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg0,
printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg1,
printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg2,
printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg3,
printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg4,
printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg5,
printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg6);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 address0,
 write0_value,
 write0_enable,
 read0_enable,
 address1,
 read1_enable,
 -- Registers
 rdaddr,
 rwaddr,
 wdata,
 rdvalue0,
 rdvalue1,
 result,
 stack_index_boost,
 -- All submodule outputs
 MUX_uxn_stack_h_l35_c22_4e18_return_output,
 BIN_OP_PLUS_uxn_stack_h_l36_c11_4fbe_return_output,
 BIN_OP_PLUS_uxn_stack_h_l37_c11_eb74_return_output,
 stack_ram_uxn_stack_h_l43_c38_f420_return_output,
 BIN_OP_AND_uxn_stack_h_l54_c13_0cae_return_output,
 MUX_uxn_stack_h_l54_c13_9dca_return_output,
 BIN_OP_AND_uxn_stack_h_l55_c13_3819_return_output,
 MUX_uxn_stack_h_l55_c13_6372_return_output,
 CONST_SL_8_uxn_stack_h_l58_c2_4938_return_output,
 BIN_OP_OR_uxn_stack_h_l59_c2_3308_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_address0 : unsigned(7 downto 0);
 variable VAR_write0_value : unsigned(7 downto 0);
 variable VAR_write0_enable : unsigned(0 downto 0);
 variable VAR_read0_enable : unsigned(0 downto 0);
 variable VAR_address1 : unsigned(7 downto 0);
 variable VAR_read1_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_stack_h_l35_c22_4e18_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_stack_h_l35_c22_4e18_iftrue : unsigned(31 downto 0);
 variable VAR_MUX_uxn_stack_h_l35_c22_4e18_iffalse : unsigned(31 downto 0);
 variable VAR_MUX_uxn_stack_h_l35_c22_4e18_return_output : unsigned(31 downto 0);
 variable VAR_rwaddr_uxn_stack_h_l36_c2_f8d5 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_stack_h_l36_c11_7254_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l36_c11_4fbe_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l36_c11_4fbe_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l36_c11_4fbe_return_output : unsigned(32 downto 0);
 variable VAR_rdaddr_uxn_stack_h_l37_c2_26b1 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_stack_h_l37_c11_3256_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l37_c11_eb74_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l37_c11_eb74_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l37_c11_eb74_return_output : unsigned(32 downto 0);
 variable VAR_wdata_uxn_stack_h_l38_c2_1095 : unsigned(7 downto 0);
 variable VAR_rw_valid : unsigned(0 downto 0);
 variable VAR_rd_valid : unsigned(0 downto 0);
 variable VAR_stack_ram_out : stack_ram_outputs_t;
 variable VAR_stack_ram_uxn_stack_h_l43_c38_f420_addr0 : unsigned(31 downto 0);
 variable VAR_stack_ram_uxn_stack_h_l43_c38_f420_wr_data0 : unsigned(7 downto 0);
 variable VAR_stack_ram_uxn_stack_h_l43_c38_f420_wr_en0 : unsigned(0 downto 0);
 variable VAR_stack_ram_uxn_stack_h_l43_c38_f420_valid0 : unsigned(0 downto 0);
 variable VAR_stack_ram_uxn_stack_h_l43_c38_f420_rd_en0 : unsigned(0 downto 0);
 variable VAR_stack_ram_uxn_stack_h_l43_c38_f420_addr1 : unsigned(31 downto 0);
 variable VAR_stack_ram_uxn_stack_h_l43_c38_f420_valid1 : unsigned(0 downto 0);
 variable VAR_stack_ram_uxn_stack_h_l43_c38_f420_rd_en1 : unsigned(0 downto 0);
 variable VAR_stack_ram_uxn_stack_h_l43_c38_f420_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_uxn_stack_h_l43_c38_f420_return_output : stack_ram_outputs_t;
 variable VAR_MUX_uxn_stack_h_l54_c13_9dca_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_stack_h_l54_c13_9dca_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_stack_h_l54_c13_9dca_iffalse : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_stack_ram_outputs_t_valid0_d41d_uxn_stack_h_l54_c13_624d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l54_c13_0cae_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l54_c13_0cae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l54_c13_0cae_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_stack_ram_outputs_t_rd_data0_d41d_uxn_stack_h_l54_c51_b566_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_stack_h_l54_c13_9dca_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_stack_h_l55_c13_6372_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_stack_h_l55_c13_6372_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_stack_h_l55_c13_6372_iffalse : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_stack_ram_outputs_t_valid1_d41d_uxn_stack_h_l55_c13_741b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l55_c13_3819_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l55_c13_3819_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l55_c13_3819_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_stack_ram_outputs_t_rd_data1_d41d_uxn_stack_h_l55_c51_953a_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_stack_h_l55_c13_6372_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_stack_h_l57_c11_c9d8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_stack_h_l58_c2_4938_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_stack_h_l58_c2_4938_x : unsigned(15 downto 0);
 variable VAR_result_uxn_stack_h_l59_c2_2835 : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_stack_h_l59_c2_3308_left : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_stack_h_l59_c13_6cbd_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_stack_h_l59_c2_3308_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_stack_h_l59_c2_3308_return_output : unsigned(15 downto 0);
 variable VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg4 : unsigned(31 downto 0);
 variable VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg5 : unsigned(31 downto 0);
 variable VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg6 : unsigned(31 downto 0);
 -- State registers comb logic variables
variable REG_VAR_rdaddr : unsigned(31 downto 0);
variable REG_VAR_rwaddr : unsigned(31 downto 0);
variable REG_VAR_wdata : unsigned(7 downto 0);
variable REG_VAR_rdvalue0 : unsigned(7 downto 0);
variable REG_VAR_rdvalue1 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(15 downto 0);
variable REG_VAR_stack_index_boost : unsigned(31 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_rdaddr := rdaddr;
  REG_VAR_rwaddr := rwaddr;
  REG_VAR_wdata := wdata;
  REG_VAR_rdvalue0 := rdvalue0;
  REG_VAR_rdvalue1 := rdvalue1;
  REG_VAR_result := result;
  REG_VAR_stack_index_boost := stack_index_boost;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_stack_h_l55_c13_6372_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_stack_h_l35_c22_4e18_iffalse := resize(to_unsigned(0, 1), 32);
     VAR_stack_ram_uxn_stack_h_l43_c38_f420_valid0 := to_unsigned(1, 1);
     VAR_MUX_uxn_stack_h_l35_c22_4e18_iftrue := resize(to_unsigned(256, 9), 32);
     VAR_stack_ram_uxn_stack_h_l43_c38_f420_valid1 := to_unsigned(1, 1);
     VAR_MUX_uxn_stack_h_l54_c13_9dca_iffalse := resize(to_unsigned(0, 1), 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_address0 := address0;
     VAR_write0_value := write0_value;
     VAR_write0_enable := write0_enable;
     VAR_read0_enable := read0_enable;
     VAR_address1 := address1;
     VAR_read1_enable := read1_enable;

     -- Submodule level 0
     VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_ram_uxn_stack_h_l43_c38_f420_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_stack_h_l54_c13_0cae_right := VAR_read0_enable;
     VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg4 := resize(VAR_read0_enable, 32);
     VAR_stack_ram_uxn_stack_h_l43_c38_f420_rd_en0 := VAR_read0_enable;
     VAR_BIN_OP_AND_uxn_stack_h_l55_c13_3819_right := VAR_read1_enable;
     VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg5 := resize(VAR_read1_enable, 32);
     VAR_stack_ram_uxn_stack_h_l43_c38_f420_rd_en1 := VAR_read1_enable;
     VAR_MUX_uxn_stack_h_l35_c22_4e18_cond := VAR_stack_index;
     VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg1 := resize(VAR_write0_enable, 32);
     VAR_stack_ram_uxn_stack_h_l43_c38_f420_wr_en0 := VAR_write0_enable;
     VAR_stack_ram_uxn_stack_h_l43_c38_f420_wr_data0 := VAR_write0_value;
     VAR_wdata_uxn_stack_h_l38_c2_1095 := VAR_write0_value;
     VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg2 := resize(VAR_wdata_uxn_stack_h_l38_c2_1095, 32);
     REG_VAR_wdata := VAR_wdata_uxn_stack_h_l38_c2_1095;
     -- MUX[uxn_stack_h_l35_c22_4e18] LATENCY=0
     -- Inputs
     MUX_uxn_stack_h_l35_c22_4e18_cond <= VAR_MUX_uxn_stack_h_l35_c22_4e18_cond;
     MUX_uxn_stack_h_l35_c22_4e18_iftrue <= VAR_MUX_uxn_stack_h_l35_c22_4e18_iftrue;
     MUX_uxn_stack_h_l35_c22_4e18_iffalse <= VAR_MUX_uxn_stack_h_l35_c22_4e18_iffalse;
     -- Outputs
     VAR_MUX_uxn_stack_h_l35_c22_4e18_return_output := MUX_uxn_stack_h_l35_c22_4e18_return_output;

     -- CAST_TO_uint32_t[uxn_stack_h_l37_c11_3256] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_stack_h_l37_c11_3256_return_output := CAST_TO_uint32_t_uint8_t(
     VAR_address1);

     -- CAST_TO_uint32_t[uxn_stack_h_l36_c11_7254] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_stack_h_l36_c11_7254_return_output := CAST_TO_uint32_t_uint8_t(
     VAR_address0);

     -- Submodule level 1
     VAR_BIN_OP_PLUS_uxn_stack_h_l36_c11_4fbe_left := VAR_CAST_TO_uint32_t_uxn_stack_h_l36_c11_7254_return_output;
     VAR_BIN_OP_PLUS_uxn_stack_h_l37_c11_eb74_left := VAR_CAST_TO_uint32_t_uxn_stack_h_l37_c11_3256_return_output;
     VAR_BIN_OP_PLUS_uxn_stack_h_l36_c11_4fbe_right := VAR_MUX_uxn_stack_h_l35_c22_4e18_return_output;
     VAR_BIN_OP_PLUS_uxn_stack_h_l37_c11_eb74_right := VAR_MUX_uxn_stack_h_l35_c22_4e18_return_output;
     REG_VAR_stack_index_boost := VAR_MUX_uxn_stack_h_l35_c22_4e18_return_output;
     -- BIN_OP_PLUS[uxn_stack_h_l36_c11_4fbe] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l36_c11_4fbe_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l36_c11_4fbe_left;
     BIN_OP_PLUS_uxn_stack_h_l36_c11_4fbe_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l36_c11_4fbe_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l36_c11_4fbe_return_output := BIN_OP_PLUS_uxn_stack_h_l36_c11_4fbe_return_output;

     -- BIN_OP_PLUS[uxn_stack_h_l37_c11_eb74] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l37_c11_eb74_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l37_c11_eb74_left;
     BIN_OP_PLUS_uxn_stack_h_l37_c11_eb74_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l37_c11_eb74_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l37_c11_eb74_return_output := BIN_OP_PLUS_uxn_stack_h_l37_c11_eb74_return_output;

     -- Submodule level 2
     VAR_rwaddr_uxn_stack_h_l36_c2_f8d5 := resize(VAR_BIN_OP_PLUS_uxn_stack_h_l36_c11_4fbe_return_output, 32);
     VAR_rdaddr_uxn_stack_h_l37_c2_26b1 := resize(VAR_BIN_OP_PLUS_uxn_stack_h_l37_c11_eb74_return_output, 32);
     VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg3 := VAR_rdaddr_uxn_stack_h_l37_c2_26b1;
     REG_VAR_rdaddr := VAR_rdaddr_uxn_stack_h_l37_c2_26b1;
     VAR_stack_ram_uxn_stack_h_l43_c38_f420_addr1 := VAR_rdaddr_uxn_stack_h_l37_c2_26b1;
     VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg0 := VAR_rwaddr_uxn_stack_h_l36_c2_f8d5;
     REG_VAR_rwaddr := VAR_rwaddr_uxn_stack_h_l36_c2_f8d5;
     VAR_stack_ram_uxn_stack_h_l43_c38_f420_addr0 := VAR_rwaddr_uxn_stack_h_l36_c2_f8d5;
     -- stack_ram[uxn_stack_h_l43_c38_f420] LATENCY=0
     -- Clock enable
     stack_ram_uxn_stack_h_l43_c38_f420_CLOCK_ENABLE <= VAR_stack_ram_uxn_stack_h_l43_c38_f420_CLOCK_ENABLE;
     -- Inputs
     stack_ram_uxn_stack_h_l43_c38_f420_addr0 <= VAR_stack_ram_uxn_stack_h_l43_c38_f420_addr0;
     stack_ram_uxn_stack_h_l43_c38_f420_wr_data0 <= VAR_stack_ram_uxn_stack_h_l43_c38_f420_wr_data0;
     stack_ram_uxn_stack_h_l43_c38_f420_wr_en0 <= VAR_stack_ram_uxn_stack_h_l43_c38_f420_wr_en0;
     stack_ram_uxn_stack_h_l43_c38_f420_valid0 <= VAR_stack_ram_uxn_stack_h_l43_c38_f420_valid0;
     stack_ram_uxn_stack_h_l43_c38_f420_rd_en0 <= VAR_stack_ram_uxn_stack_h_l43_c38_f420_rd_en0;
     stack_ram_uxn_stack_h_l43_c38_f420_addr1 <= VAR_stack_ram_uxn_stack_h_l43_c38_f420_addr1;
     stack_ram_uxn_stack_h_l43_c38_f420_valid1 <= VAR_stack_ram_uxn_stack_h_l43_c38_f420_valid1;
     stack_ram_uxn_stack_h_l43_c38_f420_rd_en1 <= VAR_stack_ram_uxn_stack_h_l43_c38_f420_rd_en1;
     -- Outputs
     VAR_stack_ram_uxn_stack_h_l43_c38_f420_return_output := stack_ram_uxn_stack_h_l43_c38_f420_return_output;

     -- Submodule level 3
     -- CONST_REF_RD_uint1_t_stack_ram_outputs_t_valid0_d41d[uxn_stack_h_l54_c13_624d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_stack_ram_outputs_t_valid0_d41d_uxn_stack_h_l54_c13_624d_return_output := VAR_stack_ram_uxn_stack_h_l43_c38_f420_return_output.valid0;

     -- CONST_REF_RD_uint1_t_stack_ram_outputs_t_valid1_d41d[uxn_stack_h_l55_c13_741b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_stack_ram_outputs_t_valid1_d41d_uxn_stack_h_l55_c13_741b_return_output := VAR_stack_ram_uxn_stack_h_l43_c38_f420_return_output.valid1;

     -- CONST_REF_RD_uint8_t_stack_ram_outputs_t_rd_data0_d41d[uxn_stack_h_l54_c51_b566] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_stack_ram_outputs_t_rd_data0_d41d_uxn_stack_h_l54_c51_b566_return_output := VAR_stack_ram_uxn_stack_h_l43_c38_f420_return_output.rd_data0;

     -- CONST_REF_RD_uint8_t_stack_ram_outputs_t_rd_data1_d41d[uxn_stack_h_l55_c51_953a] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_stack_ram_outputs_t_rd_data1_d41d_uxn_stack_h_l55_c51_953a_return_output := VAR_stack_ram_uxn_stack_h_l43_c38_f420_return_output.rd_data1;

     -- Submodule level 4
     VAR_BIN_OP_AND_uxn_stack_h_l54_c13_0cae_left := VAR_CONST_REF_RD_uint1_t_stack_ram_outputs_t_valid0_d41d_uxn_stack_h_l54_c13_624d_return_output;
     VAR_BIN_OP_AND_uxn_stack_h_l55_c13_3819_left := VAR_CONST_REF_RD_uint1_t_stack_ram_outputs_t_valid1_d41d_uxn_stack_h_l55_c13_741b_return_output;
     VAR_MUX_uxn_stack_h_l54_c13_9dca_iftrue := VAR_CONST_REF_RD_uint8_t_stack_ram_outputs_t_rd_data0_d41d_uxn_stack_h_l54_c51_b566_return_output;
     VAR_MUX_uxn_stack_h_l55_c13_6372_iftrue := VAR_CONST_REF_RD_uint8_t_stack_ram_outputs_t_rd_data1_d41d_uxn_stack_h_l55_c51_953a_return_output;
     -- BIN_OP_AND[uxn_stack_h_l54_c13_0cae] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_stack_h_l54_c13_0cae_left <= VAR_BIN_OP_AND_uxn_stack_h_l54_c13_0cae_left;
     BIN_OP_AND_uxn_stack_h_l54_c13_0cae_right <= VAR_BIN_OP_AND_uxn_stack_h_l54_c13_0cae_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_stack_h_l54_c13_0cae_return_output := BIN_OP_AND_uxn_stack_h_l54_c13_0cae_return_output;

     -- BIN_OP_AND[uxn_stack_h_l55_c13_3819] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_stack_h_l55_c13_3819_left <= VAR_BIN_OP_AND_uxn_stack_h_l55_c13_3819_left;
     BIN_OP_AND_uxn_stack_h_l55_c13_3819_right <= VAR_BIN_OP_AND_uxn_stack_h_l55_c13_3819_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_stack_h_l55_c13_3819_return_output := BIN_OP_AND_uxn_stack_h_l55_c13_3819_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_stack_h_l54_c13_9dca_cond := VAR_BIN_OP_AND_uxn_stack_h_l54_c13_0cae_return_output;
     VAR_MUX_uxn_stack_h_l55_c13_6372_cond := VAR_BIN_OP_AND_uxn_stack_h_l55_c13_3819_return_output;
     -- MUX[uxn_stack_h_l54_c13_9dca] LATENCY=0
     -- Inputs
     MUX_uxn_stack_h_l54_c13_9dca_cond <= VAR_MUX_uxn_stack_h_l54_c13_9dca_cond;
     MUX_uxn_stack_h_l54_c13_9dca_iftrue <= VAR_MUX_uxn_stack_h_l54_c13_9dca_iftrue;
     MUX_uxn_stack_h_l54_c13_9dca_iffalse <= VAR_MUX_uxn_stack_h_l54_c13_9dca_iffalse;
     -- Outputs
     VAR_MUX_uxn_stack_h_l54_c13_9dca_return_output := MUX_uxn_stack_h_l54_c13_9dca_return_output;

     -- MUX[uxn_stack_h_l55_c13_6372] LATENCY=0
     -- Inputs
     MUX_uxn_stack_h_l55_c13_6372_cond <= VAR_MUX_uxn_stack_h_l55_c13_6372_cond;
     MUX_uxn_stack_h_l55_c13_6372_iftrue <= VAR_MUX_uxn_stack_h_l55_c13_6372_iftrue;
     MUX_uxn_stack_h_l55_c13_6372_iffalse <= VAR_MUX_uxn_stack_h_l55_c13_6372_iffalse;
     -- Outputs
     VAR_MUX_uxn_stack_h_l55_c13_6372_return_output := MUX_uxn_stack_h_l55_c13_6372_return_output;

     -- Submodule level 6
     REG_VAR_rdvalue0 := VAR_MUX_uxn_stack_h_l54_c13_9dca_return_output;
     REG_VAR_rdvalue1 := VAR_MUX_uxn_stack_h_l55_c13_6372_return_output;
     -- CAST_TO_uint16_t[uxn_stack_h_l57_c11_c9d8] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_stack_h_l57_c11_c9d8_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_MUX_uxn_stack_h_l54_c13_9dca_return_output);

     -- CAST_TO_uint16_t[uxn_stack_h_l59_c13_6cbd] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_stack_h_l59_c13_6cbd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_MUX_uxn_stack_h_l55_c13_6372_return_output);

     -- Submodule level 7
     VAR_CONST_SL_8_uxn_stack_h_l58_c2_4938_x := VAR_CAST_TO_uint16_t_uxn_stack_h_l57_c11_c9d8_return_output;
     VAR_BIN_OP_OR_uxn_stack_h_l59_c2_3308_right := VAR_CAST_TO_uint16_t_uxn_stack_h_l59_c13_6cbd_return_output;
     -- CONST_SL_8[uxn_stack_h_l58_c2_4938] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_stack_h_l58_c2_4938_x <= VAR_CONST_SL_8_uxn_stack_h_l58_c2_4938_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_stack_h_l58_c2_4938_return_output := CONST_SL_8_uxn_stack_h_l58_c2_4938_return_output;

     -- Submodule level 8
     VAR_BIN_OP_OR_uxn_stack_h_l59_c2_3308_left := VAR_CONST_SL_8_uxn_stack_h_l58_c2_4938_return_output;
     -- BIN_OP_OR[uxn_stack_h_l59_c2_3308] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_stack_h_l59_c2_3308_left <= VAR_BIN_OP_OR_uxn_stack_h_l59_c2_3308_left;
     BIN_OP_OR_uxn_stack_h_l59_c2_3308_right <= VAR_BIN_OP_OR_uxn_stack_h_l59_c2_3308_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_stack_h_l59_c2_3308_return_output := BIN_OP_OR_uxn_stack_h_l59_c2_3308_return_output;

     -- Submodule level 9
     VAR_result_uxn_stack_h_l59_c2_2835 := VAR_BIN_OP_OR_uxn_stack_h_l59_c2_3308_return_output;
     VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg6 := resize(VAR_result_uxn_stack_h_l59_c2_2835, 32);
     REG_VAR_result := VAR_result_uxn_stack_h_l59_c2_2835;
     VAR_return_output := VAR_result_uxn_stack_h_l59_c2_2835;
     -- printf_uxn_stack_h_l61_c2_53ad[uxn_stack_h_l61_c2_53ad] LATENCY=0
     -- Clock enable
     printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_CLOCK_ENABLE <= VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg0 <= VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg0;
     printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg1 <= VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg1;
     printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg2 <= VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg2;
     printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg3 <= VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg3;
     printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg4 <= VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg4;
     printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg5 <= VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg5;
     printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg6 <= VAR_printf_uxn_stack_h_l61_c2_53ad_uxn_stack_h_l61_c2_53ad_arg6;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_rdaddr <= REG_VAR_rdaddr;
REG_COMB_rwaddr <= REG_VAR_rwaddr;
REG_COMB_wdata <= REG_VAR_wdata;
REG_COMB_rdvalue0 <= REG_VAR_rdvalue0;
REG_COMB_rdvalue1 <= REG_VAR_rdvalue1;
REG_COMB_result <= REG_VAR_result;
REG_COMB_stack_index_boost <= REG_VAR_stack_index_boost;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     rdaddr <= REG_COMB_rdaddr;
     rwaddr <= REG_COMB_rwaddr;
     wdata <= REG_COMB_wdata;
     rdvalue0 <= REG_COMB_rdvalue0;
     rdvalue1 <= REG_COMB_rdvalue1;
     result <= REG_COMB_result;
     stack_index_boost <= REG_COMB_stack_index_boost;
 end if;
 end if;
end process;

end arch;
