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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 76
entity deo_0CLK_8de214c4 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_8de214c4;
architecture arch of deo_0CLK_8de214c4 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l525_c6_0356]
signal BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l530_c7_eeba]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l525_c2_2478]
signal n8_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l525_c2_2478_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l525_c2_2478]
signal t8_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l525_c2_2478_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l525_c2_2478]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l525_c2_2478]
signal result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l525_c2_2478]
signal result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l525_c2_2478]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l525_c2_2478]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l525_c2_2478]
signal result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l525_c2_2478]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l525_c2_2478]
signal result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l525_c2_2478]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l525_c2_2478]
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l525_c2_2478]
signal device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l530_c11_e0b3]
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l533_c7_a7d0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l530_c7_eeba]
signal n8_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l530_c7_eeba]
signal t8_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l530_c7_eeba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l530_c7_eeba]
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l530_c7_eeba]
signal result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l530_c7_eeba]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l530_c7_eeba]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l530_c7_eeba]
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l530_c7_eeba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l530_c7_eeba]
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l530_c7_eeba]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l530_c7_eeba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l530_c7_eeba]
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l533_c11_e2af]
signal BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l537_c7_8dc6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l533_c7_a7d0]
signal n8_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l533_c7_a7d0]
signal t8_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l533_c7_a7d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l533_c7_a7d0]
signal result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l533_c7_a7d0]
signal result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l533_c7_a7d0]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l533_c7_a7d0]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l533_c7_a7d0]
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l533_c7_a7d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l533_c7_a7d0]
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l533_c7_a7d0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l533_c7_a7d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l533_c7_a7d0]
signal device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l537_c11_c34a]
signal BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l540_c7_7e08]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l537_c7_8dc6]
signal n8_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l537_c7_8dc6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l537_c7_8dc6]
signal result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l537_c7_8dc6]
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l537_c7_8dc6]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l537_c7_8dc6]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l537_c7_8dc6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l537_c7_8dc6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l537_c7_8dc6]
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l537_c7_8dc6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l537_c7_8dc6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l537_c7_8dc6]
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l540_c11_449d]
signal BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l545_c1_ba19]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l540_c7_7e08]
signal n8_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l540_c7_7e08]
signal result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l540_c7_7e08]
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l540_c7_7e08]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l540_c7_7e08]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l540_c7_7e08]
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l540_c7_7e08]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l540_c7_7e08]
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l540_c7_7e08]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l540_c7_7e08]
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l540_c7_7e08]
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : device_out_result_t;

-- sp_relative_shift[uxn_opcodes_h_l543_c30_6417]
signal sp_relative_shift_uxn_opcodes_h_l543_c30_6417_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l543_c30_6417_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l543_c30_6417_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l543_c30_6417_return_output : signed(3 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l547_c42_4d3b]
signal BIN_OP_MINUS_uxn_opcodes_h_l547_c42_4d3b_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l547_c42_4d3b_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l547_c42_4d3b_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l547_c23_8f66]
signal device_out_uxn_opcodes_h_l547_c23_8f66_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l547_c23_8f66_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l547_c23_8f66_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l547_c23_8f66_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l547_c23_8f66_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l547_c23_8f66_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_aa5e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.vram_address := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;
      base.vram_write_layer := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.device_ram_address := ref_toks_8;
      base.is_sp_shift := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356
BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_left,
BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_right,
BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_return_output);

-- n8_MUX_uxn_opcodes_h_l525_c2_2478
n8_MUX_uxn_opcodes_h_l525_c2_2478 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l525_c2_2478_cond,
n8_MUX_uxn_opcodes_h_l525_c2_2478_iftrue,
n8_MUX_uxn_opcodes_h_l525_c2_2478_iffalse,
n8_MUX_uxn_opcodes_h_l525_c2_2478_return_output);

-- t8_MUX_uxn_opcodes_h_l525_c2_2478
t8_MUX_uxn_opcodes_h_l525_c2_2478 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l525_c2_2478_cond,
t8_MUX_uxn_opcodes_h_l525_c2_2478_iftrue,
t8_MUX_uxn_opcodes_h_l525_c2_2478_iffalse,
t8_MUX_uxn_opcodes_h_l525_c2_2478_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478
result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_cond,
result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478
result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_cond,
result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478
result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478
result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478
result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478
result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l525_c2_2478
device_out_result_MUX_uxn_opcodes_h_l525_c2_2478 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_cond,
device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_iftrue,
device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_iffalse,
device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3
BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_left,
BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_right,
BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output);

-- n8_MUX_uxn_opcodes_h_l530_c7_eeba
n8_MUX_uxn_opcodes_h_l530_c7_eeba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l530_c7_eeba_cond,
n8_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue,
n8_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse,
n8_MUX_uxn_opcodes_h_l530_c7_eeba_return_output);

-- t8_MUX_uxn_opcodes_h_l530_c7_eeba
t8_MUX_uxn_opcodes_h_l530_c7_eeba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l530_c7_eeba_cond,
t8_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue,
t8_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse,
t8_MUX_uxn_opcodes_h_l530_c7_eeba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba
result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_cond,
result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba
result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_cond,
result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba
device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_cond,
device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue,
device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse,
device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af
BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_left,
BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_right,
BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output);

-- n8_MUX_uxn_opcodes_h_l533_c7_a7d0
n8_MUX_uxn_opcodes_h_l533_c7_a7d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l533_c7_a7d0_cond,
n8_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue,
n8_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse,
n8_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output);

-- t8_MUX_uxn_opcodes_h_l533_c7_a7d0
t8_MUX_uxn_opcodes_h_l533_c7_a7d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l533_c7_a7d0_cond,
t8_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue,
t8_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse,
t8_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0
result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_cond,
result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0
result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_cond,
result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0
result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0
result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0
result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0
device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_cond,
device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue,
device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse,
device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a
BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_left,
BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_right,
BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_return_output);

-- n8_MUX_uxn_opcodes_h_l537_c7_8dc6
n8_MUX_uxn_opcodes_h_l537_c7_8dc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l537_c7_8dc6_cond,
n8_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue,
n8_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse,
n8_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6
result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_cond,
result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6
result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_cond,
result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6
device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_cond,
device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue,
device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse,
device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d
BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_left,
BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_right,
BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_return_output);

-- n8_MUX_uxn_opcodes_h_l540_c7_7e08
n8_MUX_uxn_opcodes_h_l540_c7_7e08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l540_c7_7e08_cond,
n8_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue,
n8_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse,
n8_MUX_uxn_opcodes_h_l540_c7_7e08_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08
result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_cond,
result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08
result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_cond,
result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08
device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_cond,
device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue,
device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse,
device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_return_output);

-- sp_relative_shift_uxn_opcodes_h_l543_c30_6417
sp_relative_shift_uxn_opcodes_h_l543_c30_6417 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l543_c30_6417_ins,
sp_relative_shift_uxn_opcodes_h_l543_c30_6417_x,
sp_relative_shift_uxn_opcodes_h_l543_c30_6417_y,
sp_relative_shift_uxn_opcodes_h_l543_c30_6417_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l547_c42_4d3b
BIN_OP_MINUS_uxn_opcodes_h_l547_c42_4d3b : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l547_c42_4d3b_left,
BIN_OP_MINUS_uxn_opcodes_h_l547_c42_4d3b_right,
BIN_OP_MINUS_uxn_opcodes_h_l547_c42_4d3b_return_output);

-- device_out_uxn_opcodes_h_l547_c23_8f66
device_out_uxn_opcodes_h_l547_c23_8f66 : entity work.device_out_0CLK_b285e9e3 port map (
clk,
device_out_uxn_opcodes_h_l547_c23_8f66_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l547_c23_8f66_device_address,
device_out_uxn_opcodes_h_l547_c23_8f66_value,
device_out_uxn_opcodes_h_l547_c23_8f66_phase,
device_out_uxn_opcodes_h_l547_c23_8f66_previous_device_ram_read,
device_out_uxn_opcodes_h_l547_c23_8f66_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 -- Registers
 t8,
 n8,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_return_output,
 n8_MUX_uxn_opcodes_h_l525_c2_2478_return_output,
 t8_MUX_uxn_opcodes_h_l525_c2_2478_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_return_output,
 device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output,
 n8_MUX_uxn_opcodes_h_l530_c7_eeba_return_output,
 t8_MUX_uxn_opcodes_h_l530_c7_eeba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_return_output,
 device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output,
 n8_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output,
 t8_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output,
 device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_return_output,
 n8_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output,
 device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_return_output,
 n8_MUX_uxn_opcodes_h_l540_c7_7e08_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_return_output,
 device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_return_output,
 sp_relative_shift_uxn_opcodes_h_l543_c30_6417_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l547_c42_4d3b_return_output,
 device_out_uxn_opcodes_h_l547_c23_8f66_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l525_c2_2478_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l525_c2_2478_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l527_c3_4791 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l531_c3_ac64 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_226d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l538_c3_2903 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l537_c7_8dc6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_6417_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_6417_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_6417_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_6417_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l547_c23_8f66_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l547_c23_8f66_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l547_c23_8f66_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l547_c23_8f66_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_4d3b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_4d3b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_4d3b_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l547_c23_8f66_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l547_c23_8f66_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l548_c32_bbe3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l549_c31_a4ff_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l550_c21_b061_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l551_c26_3b26_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l552_c29_d153_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l553_c25_3dfb_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l554_c24_3baf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_2419_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_2c93_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_9e31_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_4abd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_e820_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_f579_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_8641_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l525_l537_l533_l530_DUPLICATE_f0bf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l533_l530_l540_DUPLICATE_1066_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_aa5e_uxn_opcodes_h_l520_l557_DUPLICATE_eba5_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
variable REG_VAR_device_out_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l527_c3_4791 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l527_c3_4791;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_6417_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_226d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_226d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_4d3b_right := to_unsigned(5, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l531_c3_ac64 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l531_c3_ac64;
     VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_6417_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l538_c3_2903 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l538_c3_2903;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_right := to_unsigned(4, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_6417_ins := VAR_ins;
     VAR_device_out_uxn_opcodes_h_l547_c23_8f66_value := n8;
     VAR_n8_MUX_uxn_opcodes_h_l525_c2_2478_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_4d3b_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l547_c23_8f66_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l547_c23_8f66_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l525_c2_2478_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_4abd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_4abd_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_9e31 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_9e31_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_e820 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_e820_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_2419 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_2419_return_output := result.u8_value;

     -- BIN_OP_MINUS[uxn_opcodes_h_l547_c42_4d3b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l547_c42_4d3b_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_4d3b_left;
     BIN_OP_MINUS_uxn_opcodes_h_l547_c42_4d3b_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_4d3b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_4d3b_return_output := BIN_OP_MINUS_uxn_opcodes_h_l547_c42_4d3b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_8641 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_8641_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_2c93 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_2c93_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l530_c11_e0b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l525_c6_0356] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_left;
     BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_return_output := BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l537_c11_c34a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_left;
     BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_return_output := BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l540_c11_449d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_left;
     BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_return_output := BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l533_l530_l540_DUPLICATE_1066 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l533_l530_l540_DUPLICATE_1066_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l537_c7_8dc6] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l537_c7_8dc6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l533_c11_e2af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_left;
     BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_return_output := BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l525_l537_l533_l530_DUPLICATE_f0bf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l525_l537_l533_l530_DUPLICATE_f0bf_return_output := result.is_sp_shift;

     -- sp_relative_shift[uxn_opcodes_h_l543_c30_6417] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l543_c30_6417_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_6417_ins;
     sp_relative_shift_uxn_opcodes_h_l543_c30_6417_x <= VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_6417_x;
     sp_relative_shift_uxn_opcodes_h_l543_c30_6417_y <= VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_6417_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_6417_return_output := sp_relative_shift_uxn_opcodes_h_l543_c30_6417_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_f579 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_f579_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l525_c2_2478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l525_c2_2478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_0356_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_e0b3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l533_c7_a7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l533_c7_a7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c11_e2af_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_8dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_c34a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_7e08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_449d_return_output;
     VAR_device_out_uxn_opcodes_h_l547_c23_8f66_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l547_c42_4d3b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_f579_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_f579_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_f579_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_f579_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_f579_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_9e31_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_9e31_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_9e31_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_9e31_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_9e31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l533_l530_l540_DUPLICATE_1066_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l533_l530_l540_DUPLICATE_1066_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l533_l530_l540_DUPLICATE_1066_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l533_l530_l540_DUPLICATE_1066_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l525_l537_l533_l530_DUPLICATE_f0bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l525_l537_l533_l530_DUPLICATE_f0bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l525_l537_l533_l530_DUPLICATE_f0bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l525_l537_l533_l530_DUPLICATE_f0bf_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_e820_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_e820_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_e820_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_e820_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_e820_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_4abd_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_4abd_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_4abd_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_4abd_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_4abd_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_2c93_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_2c93_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_2c93_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_2c93_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_2c93_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_8641_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_8641_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_8641_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_8641_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_8641_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_2419_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_2419_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_2419_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_2419_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l540_l533_l525_l530_DUPLICATE_2419_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l537_c7_8dc6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l543_c30_6417_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l540_c7_7e08] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;

     -- t8_MUX[uxn_opcodes_h_l533_c7_a7d0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l533_c7_a7d0_cond <= VAR_t8_MUX_uxn_opcodes_h_l533_c7_a7d0_cond;
     t8_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue;
     t8_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output := t8_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l530_c7_eeba] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l537_c7_8dc6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l540_c7_7e08] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;

     -- n8_MUX[uxn_opcodes_h_l540_c7_7e08] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l540_c7_7e08_cond <= VAR_n8_MUX_uxn_opcodes_h_l540_c7_7e08_cond;
     n8_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue;
     n8_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_7e08_return_output := n8_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse := VAR_t8_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l533_c7_a7d0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;

     -- n8_MUX[uxn_opcodes_h_l537_c7_8dc6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l537_c7_8dc6_cond <= VAR_n8_MUX_uxn_opcodes_h_l537_c7_8dc6_cond;
     n8_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue;
     n8_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output := n8_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l537_c7_8dc6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;

     -- t8_MUX[uxn_opcodes_h_l530_c7_eeba] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l530_c7_eeba_cond <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_eeba_cond;
     t8_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue;
     t8_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_eeba_return_output := t8_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l533_c7_a7d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l537_c7_8dc6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l525_c2_2478_iffalse := VAR_t8_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;
     -- n8_MUX[uxn_opcodes_h_l533_c7_a7d0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l533_c7_a7d0_cond <= VAR_n8_MUX_uxn_opcodes_h_l533_c7_a7d0_cond;
     n8_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue;
     n8_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output := n8_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l530_c7_eeba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l533_c7_a7d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l533_c7_a7d0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l537_c7_8dc6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;

     -- t8_MUX[uxn_opcodes_h_l525_c2_2478] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l525_c2_2478_cond <= VAR_t8_MUX_uxn_opcodes_h_l525_c2_2478_cond;
     t8_MUX_uxn_opcodes_h_l525_c2_2478_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l525_c2_2478_iftrue;
     t8_MUX_uxn_opcodes_h_l525_c2_2478_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l525_c2_2478_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l525_c2_2478_return_output := t8_MUX_uxn_opcodes_h_l525_c2_2478_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse := VAR_n8_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l525_c2_2478_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l530_c7_eeba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;

     -- n8_MUX[uxn_opcodes_h_l530_c7_eeba] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l530_c7_eeba_cond <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_eeba_cond;
     n8_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue;
     n8_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_eeba_return_output := n8_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l540_c7_7e08] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l525_c2_2478] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l530_c7_eeba] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l525_c2_2478_iffalse := VAR_n8_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l545_c1_ba19] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l525_c2_2478] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l525_c2_2478] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_return_output;

     -- n8_MUX[uxn_opcodes_h_l525_c2_2478] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l525_c2_2478_cond <= VAR_n8_MUX_uxn_opcodes_h_l525_c2_2478_cond;
     n8_MUX_uxn_opcodes_h_l525_c2_2478_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l525_c2_2478_iftrue;
     n8_MUX_uxn_opcodes_h_l525_c2_2478_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l525_c2_2478_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l525_c2_2478_return_output := n8_MUX_uxn_opcodes_h_l525_c2_2478_return_output;

     -- Submodule level 6
     VAR_device_out_uxn_opcodes_h_l547_c23_8f66_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l545_c1_ba19_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l525_c2_2478_return_output;
     -- device_out[uxn_opcodes_h_l547_c23_8f66] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l547_c23_8f66_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l547_c23_8f66_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l547_c23_8f66_device_address <= VAR_device_out_uxn_opcodes_h_l547_c23_8f66_device_address;
     device_out_uxn_opcodes_h_l547_c23_8f66_value <= VAR_device_out_uxn_opcodes_h_l547_c23_8f66_value;
     device_out_uxn_opcodes_h_l547_c23_8f66_phase <= VAR_device_out_uxn_opcodes_h_l547_c23_8f66_phase;
     device_out_uxn_opcodes_h_l547_c23_8f66_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l547_c23_8f66_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l547_c23_8f66_return_output := device_out_uxn_opcodes_h_l547_c23_8f66_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse := VAR_device_out_uxn_opcodes_h_l547_c23_8f66_return_output;
     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l549_c31_a4ff] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l549_c31_a4ff_return_output := VAR_device_out_uxn_opcodes_h_l547_c23_8f66_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l548_c32_bbe3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l548_c32_bbe3_return_output := VAR_device_out_uxn_opcodes_h_l547_c23_8f66_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l551_c26_3b26] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l551_c26_3b26_return_output := VAR_device_out_uxn_opcodes_h_l547_c23_8f66_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l554_c24_3baf] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l554_c24_3baf_return_output := VAR_device_out_uxn_opcodes_h_l547_c23_8f66_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l552_c29_d153] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l552_c29_d153_return_output := VAR_device_out_uxn_opcodes_h_l547_c23_8f66_return_output.vram_write_layer;

     -- device_out_result_MUX[uxn_opcodes_h_l540_c7_7e08] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_cond;
     device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_return_output := device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l550_c21_b061] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l550_c21_b061_return_output := VAR_device_out_uxn_opcodes_h_l547_c23_8f66_return_output.u8_value;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l553_c25_3dfb] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l553_c25_3dfb_return_output := VAR_device_out_uxn_opcodes_h_l547_c23_8f66_return_output.vram_address;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l554_c24_3baf_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l548_c32_bbe3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l551_c26_3b26_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l552_c29_d153_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l553_c25_3dfb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l549_c31_a4ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l550_c21_b061_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l540_c7_7e08] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_cond;
     result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_return_output := result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l537_c7_8dc6] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_cond;
     device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output := device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l540_c7_7e08] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l540_c7_7e08] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l540_c7_7e08] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l540_c7_7e08] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l540_c7_7e08] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_cond;
     result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_return_output := result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l540_c7_7e08] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;

     -- Submodule level 9
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_7e08_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l533_c7_a7d0] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_cond;
     device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output := device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l537_c7_8dc6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l537_c7_8dc6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l537_c7_8dc6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l537_c7_8dc6] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l537_c7_8dc6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output := result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l537_c7_8dc6] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_cond;
     result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output := result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l537_c7_8dc6] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;

     -- Submodule level 10
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_8dc6_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l533_c7_a7d0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l533_c7_a7d0] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l533_c7_a7d0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output := result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l533_c7_a7d0] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_cond;
     result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output := result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l530_c7_eeba] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_cond;
     device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_return_output := device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l533_c7_a7d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l533_c7_a7d0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l533_c7_a7d0] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;

     -- Submodule level 11
     VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c7_a7d0_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l530_c7_eeba] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l530_c7_eeba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l530_c7_eeba] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l530_c7_eeba] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_cond;
     result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_return_output := result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l525_c2_2478] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_cond;
     device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_return_output := device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l530_c7_eeba] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l530_c7_eeba] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l530_c7_eeba] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_cond;
     result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_return_output := result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;

     -- Submodule level 12
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l525_c2_2478_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_eeba_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l525_c2_2478] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l525_c2_2478] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_cond;
     result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_return_output := result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l525_c2_2478] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l525_c2_2478] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l525_c2_2478] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l525_c2_2478] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l525_c2_2478] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_cond;
     result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_return_output := result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_aa5e_uxn_opcodes_h_l520_l557_DUPLICATE_eba5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_aa5e_uxn_opcodes_h_l520_l557_DUPLICATE_eba5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_aa5e(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l525_c2_2478_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l525_c2_2478_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l525_c2_2478_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l525_c2_2478_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l525_c2_2478_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l525_c2_2478_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l525_c2_2478_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l525_c2_2478_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l525_c2_2478_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_2478_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_aa5e_uxn_opcodes_h_l520_l557_DUPLICATE_eba5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_aa5e_uxn_opcodes_h_l520_l557_DUPLICATE_eba5_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_out_result <= REG_VAR_device_out_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
